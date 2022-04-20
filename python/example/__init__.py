import numpy as np

try:
    import importlib.metadata as importlib_metadata
except ModuleNotFoundError:
    import importlib_metadata


try:
    # This will read version from pyproject.toml
    __version__ = importlib_metadata.version(__name__)
except Exception:
    __version__ = "unknown"


def example(n=3):
    return np.zeros(3)
