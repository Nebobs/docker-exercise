import sys
from attrdict import AttrDict

if sys.version_info[0:2] != (3, 12):
    raise EnvironmentError("This script requires Python 3.12!")

random_dict = AttrDict({"Hello": 0, "World": 1})
print(random_dict)
