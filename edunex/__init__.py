import sys

__version__ = "17.0.0-dev"

# Compatibility alias for transitions
if "education" not in sys.modules:
	sys.modules["education"] = sys.modules[__name__]
