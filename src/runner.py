import numpy as np
import matlab.engine
from src.params import PARAMS, INPUTS, BOUNDS
import openmdao.api as om
import src.designvariablemapper.designvariablemapper as dvmapper
import src.hydro.hydro as hydro
import src.systemdynamics.sysdyn as sysdyn
import src.econ.econ as econ
import src.desal.desal as desal

class RunWDDS:
    def __init__(self,eng):
        self.eng = eng

    def create_problem(self):
        self.prob = om.Problem(reports=None)

        self.prob.model.add_subsystem('Mapper',dvmapper.DesignVariableMapper(),promotes_inputs=["*"],promotes_outputs=["*"])
        self.prob.model.add_subsystem('Hydro',hydro.Hydro(),promotes_inputs=["*"],promotes_outputs=["*"])
        self.prob.model.add_subsystem('DesalParams',desal.DesalParams(),promotes_inputs=["*"],promotes_outputs=["*"])
        self.prob.model.add_subsystem('SysDyn',sysdyn.SysDyn(self.eng),promotes_inputs=["*"],promotes_outputs=["*"])
        self.prob.model.add_subsystem('Econ',econ.Econ(),promotes_inputs=["*"],promotes_outputs=["*"])

        for key, val in INPUTS.items():
            lower, upper = BOUNDS.get(key, (None, None))
            self.prob.model.add_design_var(key, lower=lower, upper=upper)

        self.prob.model.add_objective('LCOW')

        self.prob.driver = om.SimpleGADriver()
        self.prob.setup()
        
    def solve_once(self, design_variables = INPUTS):
        for var_name, var_value in design_variables.items():
            print(f"setting {var_name} to {var_value}")
            self.prob.set_val(var_name, var_value)
        self.prob.run_model()
        return self.prob.get_val('LCOW')
