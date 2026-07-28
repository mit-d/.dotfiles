"""Put this directory on sys.path so tests can import the ffbm_* modules."""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
