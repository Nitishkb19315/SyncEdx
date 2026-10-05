import sys

__version__ = "17.0.0-dev"

# Compatibility aliases for transitions
if "edunex" not in sys.modules:
	sys.modules["edunex"] = sys.modules[__name__]
if "education" not in sys.modules:
	sys.modules["education"] = sys.modules[__name__]
