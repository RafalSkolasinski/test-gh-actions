import numpy as np
from example import example


def test_example():
    assert np.allclose(example(), np.zeros(3))
