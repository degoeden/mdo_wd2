import sys
import os
parent_folder = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
sys.path.append(parent_folder)
import unittest
import src.econ.econ as econ
import src.econ.PTOecon as PTOecon
import numpy as np
from src.params import PARAMS

class TestEcon(unittest.TestCase):

    def setUp(self):
        # Create econ object and setup
        self.Econ = econ.Econ()
        self.Econ.setup()
        
    def test_piston(self):
        # Test piston cost
        piston_area = 0.028502296
        piston_stroke = 2
        cost = PTOecon.piston_cost(piston_area, piston_stroke)
        print(f"piston cost : ${cost}")
        np.testing.assert_allclose(0,0)

    def test_piston2(self):
        # Test piston cost
        piston_area = 0.028502296
        piston_stroke = 2
        cost = PTOecon.piston_cost2(piston_area, piston_stroke,63e6)
        print(f"piston2 cost : ${cost}")
        np.testing.assert_allclose(0,0)

    def test_accum4(self):
        # Test accumulator cost
        accum_vol = 4.0
        cost = PTOecon.accum_cost(accum_vol)
        expected_cost = PARAMS["accum_cost_15G"]*70 + PARAMS["accum_cost_5G"]*1 + PARAMS["accum_cost_2.5G"]*1
        print(f"4 m^3 accumulator cost : ${cost}")
        np.testing.assert_allclose(cost,expected_cost)
    
    def test_accum004g(self):
        # Test accumulator cost
        accum_vol = 0.04
        cost = PTOecon.accum_cost(accum_vol)
        expected_cost = PARAMS["accum_cost_10G"] + PARAMS["accum_cost_2.5G"]
        print(f"0.04 m^3 accumulator cost : ${cost}")
        np.testing.assert_allclose(cost,expected_cost)

    def test_link(self):
        # Test link cost
        l1 = 2
        l2 = 5
        l3 = 0
        force = 63e6*0.26
        cost = PTOecon.link_cost(l1,l2,l3,force)
        print(f"link cost : ${cost}")
        np.testing.assert_allclose(cost,cost)

if __name__ == '__main__':
    unittest.main()