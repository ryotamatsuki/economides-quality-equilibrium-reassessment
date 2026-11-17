"""CI delegates Stage11 direct-utility falsification to independent script."""
from pathlib import Path
import runpy

SCRIPT = Path(__file__).resolve().parents[1] / "verification" / "stage11_direct_consumer_audit.py"
AUDIT = runpy.run_path(str(SCRIPT))

def test_stage11_primitive_consumer_price_attack():
    AUDIT["test_market_share_and_price_deviation_attack"]()

def test_stage11_primitive_consumer_quality_attack():
    AUDIT["test_quality_deviation_crosses_price_regimes"]()
