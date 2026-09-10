# RIO Stage-13 Author-Metadata Carry-Forward

Target journal: **Review of Industrial Organization**.

Evidence snapshot: **2026-09-10 JST**.

This file separates verified journal requirements from author-specific facts that must not be inferred during manuscript integration.

## Already implemented in the manuscript/package

- Abstract is within the verified RIO range of 150--250 words.
- Five keywords are present.
- JEL classifications are present: `C72`, `D43`, `L13`, `R32`.
- Cohen and Heifetz (2024) is integrated as a recent structural comparison.
- A Data and Code Availability statement is included in `paper/sections/research_transparency.tex`.
- Non-copyediting generative-AI use is documented in `paper/sections/research_transparency.tex` in accordance with the current Springer instruction that LLM use be documented in Methods or a suitable alternative part of the manuscript.
- `scripts/build_rio_flat_package.py` creates a no-subfolder LaTeX package while preserving the modular canonical research source.

## Author-specific items requiring explicit confirmation before Stage-14 PASS

The following must be supplied or confirmed by the author; no value is inferred here:

1. Author name(s) as they should appear in publication metadata.
2. Affiliation(s), city, and country.
3. Active corresponding-author email.
4. ORCID, if available.
5. Funding statement, including the full names of funding bodies if applicable.
6. Competing Interests statement.
7. Author Contribution / CRediT statement as required by the submission interface.
8. Acknowledgments, if any.

## Requirements still `UNVERIFIED` / portal-only

These remain fail-closed for Stage 14 and must not be guessed from generic Springer behavior:

- RIO's current review/anonymity model and resulting identified-vs-anonymous file arrangement.
- Exact article-type label offered by the authenticated portal (regular article versus any note/commentary category).
- Portal-specific mandatory fields and ordering.
- Whether reviewer suggestions or exclusions are mandatory rather than merely available.
- Any submission fee displayed in the portal.
- Any RIO-specific preprint declaration or repository-link handling not visible on the public instructions.

## Stage-14 action

Refresh the official RIO instructions on the actual submission date and inspect the authenticated portal before inserting author-identifying information into a review file. Complete all author-specific declarations, then build the exact identified/anonymous/title-page variants required by the live workflow.
