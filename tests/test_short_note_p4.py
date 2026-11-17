from pathlib import Path
import runpy

def test_short_note_p4_global_best_response_audit():
    script=Path(__file__).resolve().parents[1] / "verification" / "short_note_independent_audit.py"
    assert script.is_file()
    runpy.run_path(str(script),run_name="__main__")
