# BER理論短報の独立査読・新規性再監査

公開用。非公開の編集・査読連絡の詳細を省略し、原稿比較で確認できる所見を記載した。

## Report 1 — Executive Decision

**B. 追加確認・限定修正後に判断。現稿のBER投稿は見送り。Stage 11は REOPEN EARLIER STAGE / NO-GO。**

固定端点の価格均衡の一意性と、品質均衡が費用閾値 \(4/27\) で二つから三つになる完全分類を原始モデルから確認した。Economidesの市場分割予測に対する反証は成立する。Bunte（1997）の局所調整条件とも区別できる。一方、Bunte（1995）とSorenson（1995）は、同じ価格分岐を用いた最適反応が既出であれば完全分類を短く導けるため、本文未確認が投稿判断を左右する。ETB稿は分類をすでに証明しており、BER改訂の前進は主に説明面にある。先行研究に対する差分と、その差分が専門外の読者にも重要である理由をStage 6で再認証する。

| 評価軸 | 判定 | 根拠 |
|---|---|---|
| Mathematical Validity | **PASS** | 全品質での純粋価格均衡の存在・一意性と、定理1の必要十分性を解析的に独立確認。価格一意性の本文の書き方に補修箇所あり |
| Prior-Art Distinctness | **UNRESOLVED** | P2・P4の原文で大域的反応または同値の命題を照合できていない |
| Research Question Alignment | **PASS** | pp. 1–2の固定端点の問いとp. 3定理1は一致。Economidesへの含意は固定端点での必要条件の反証 |
| Economic Significance | **LIMITED** | 費用低下が市場分割の可能性だけを消す点に知見。一般的な分岐や非対称化は既知で、純粋SPNEの既知の障害とは別の価値を立てる必要がある |
| Generality & Scope | **LIMITED** | 限定された定理を正しく量化。輸送費形状の同値例と品質上限・同時手番の反例により射程を特定 |

### 対象と監査順序

2026年11月21日（日本時間）。対象はブランチ `review/ber-revision-20261121` の指定コミット `ba13033d27ac5106f7d5f845239f80a826bb4974`、`review/BER_20261121/main.pdf` 全6頁。Git blob `b49033b493702e3f5e52a112c5dd679e76ff5903` を取得ファイルと照合。SHA-256は `17d5bf162e39bb03661ed932af1f0f369752dfc1781e0f7a8fe8795384356d20`。使用したソース・補助資料は同じコミット。ETB比較は旧コミットを別に指定した。 [査読原稿](https://github.com/ryotamatsuki/economides-quality-equilibrium-reassessment/blob/ba13033d27ac5106f7d5f845239f80a826bb4974/review/BER_20261121/main.pdf)

PDFの初読所見を単独で固定し、先行研究の照合、独立導出と計算、BERとの比較、旧稿と編集・査読記録の照合の順に判断した。依頼文から中心定理・競合文献・旧判定の概要を事前に知っていた。4レポートは同一監査者による役割別審査で、独立性は評価経路と独立実装にある。ワークフローはGitHubの正式リリースv3.2をピン留めしてGovernance、Pipeline、指定テンプレートとChecklistを適用した。タグ内のGovernanceとPipelineには見出し上「v3.0」が残るため、リリースタグと中身を版の根拠とした。 [v3.2リリース](https://github.com/ryotamatsuki/research-paper-workflow/releases/tag/v3.2)

### Phase A 初読を固定した英文

The paper asks whether two firms at opposite endpoints necessarily share a fully covered market when they choose quality before prices. Its contribution is a complete pure-strategy equilibrium correspondence for one cost interval of the fixed-location continuation game. A discrete increase in quality can move the price equilibrium across the boundary from positive sales for both firms to capture by one firm. The previously proposed symmetric profile fails the resulting global deviation test at sufficiently low quality costs, although two asymmetric equilibria persist. With higher costs within the interval, symmetric sharing joins those two outcomes. The economic lesson is that lower investment costs can eliminate a competitive market structure while preserving equilibrium, and that greater costs need not eliminate exclusion. The result also removes a necessary continuation for part of Economides's original proposition about the location game. My strongest editorial reservation is that the paper identifies an unresolved overlap with earlier work precisely where its claim to independent contribution lies. Conditional on distinctness, the result would fill a real but tightly bounded gap about equilibrium composition, with no selection or endogenous-location result.

初読で記録した説明面の懸念は、p. 2 Lemma 1が存在表現のまま式(4)へ進む点、p. 4 Appendix Aが \(\delta=\pm3\) での一意性を独立に示さない点、p. 2で差分と優先権の保留が同じ段落に重なる点。科学面では競合資料との重複が最大の懸念だった。初読記録のSHA-256は `e64bedf355d20dd75edd6d8c5497c4d968f16d6b870b31978b6b9a528dc41c05`。

## Report 2 — Novelty and Theorem Absorption Audit

| 文献・確認深度 | 同一モデルか | 同一解概念か | 同一閾値か | 完全分類は既出か | 判定 |
|---|---|---|---|---|---|
| Economides（1989）著者公開版、pp. 22–24, 27–28、式(1), (8)–(10)、Theorem 2 | 三段階の端点継続で効用、品質費用、分割価格を回収。端点を超える立地選択が原論文にある | 原論文は純粋SPNEを主張。品質段階の証明は分割価格を代入したFOC | \(1/9,2/9\) は共通。\(4/27\) の大域的比較は導出にない | Theorem 2の対称予測と両立しない範囲を確定。対称候補と分割価格は既出 | **APPARENTLY DISTINCT**（完全分類） |
| Bunte（1995）CRIEFF 9509。発行元目録と著者プロフィールの要旨冒頭 | Hotelling・品質と品種の競争、価格不安定性と限界価格が近い。効用・費用・戦略境界は未照合 | 大域的純粋Nashの扱いは未確認 | 換算不能 | 未確認。1997年の章は同じ研究系統である可能性が高いが、版の同一性は未確認 | **UNRESOLVED** |
| Bunte（1997）博士論文第3章、§2.2–2.3、§3.1–3.4、§4.1–4.3、§8の該当箇所と付録参照 | 端点・同じ初期品質で分割枝は同一。一般立地・初期品質差・二つの価格シナリオも論じる | §3は分割枝の内点Nashと反応調整安定性。§4は同じ静学価格Nashを求める手順を採っていない | \(18\kappa t=1,2\) が \(1/9,2/9\) に対応。\(4/27\) とは異なる | 検証した枝別式および節から完全分類は得られない。局所安定性批判は既出 | **APPARENTLY DISTINCT**（完全分類） |
| Sorenson（1995）Springer要旨・書誌、Bunte（1997）pp. 106, 122–123の二次証拠 | 品質改善R&D→差別化Bertrand。固定端点と同じR&D仕様はBunteの報告で強く示唆される。初期品質差のゼロ極限と戦略域は未照合 | 要旨は水平差別化下で既存首位の優位拡大。大域的反応と純粋均衡の列挙は未確認 | 著者レベルの費用換算は保留。Bunteは同じ局所安定性条件を報告 | 未確認。初期差ゼロの対称企業に拡張可能な大域的反応式が最大の重複リスク | **UNRESOLVED** |

一次資料と取得範囲は [Economides原文](https://neconomides.com/uploads/Economides_Quality_Variations_and_Maximal_Variety_Differentiation.pdf)、[CRIEFF目録](https://crieff.wordpress.com/research/discussion-papers/)、[Bunte著者プロフィール](https://www.researchgate.net/profile/Frank-Bunte-2)、[Bunte博士論文全文](https://cris.maastrichtuniversity.nl/files/813351/guid-4c6cc7b3-08f2-4668-a315-0e792cca3ec5-ASSET1.0.pdf)、[Sorenson出版社要旨と参考文献](https://link.springer.com/article/10.1007/BF01027081)。CRIEFFの9509には同目録のダウンロード可記号がなく、St Andrewsリポジトリ・完全題名・番号検索で本文に到達しなかった。Sorensonの出版社PDFはアクセス不可で、DOI、著者名、誌名・号、書誌索引を併用した公開版探索でも本文に到達しなかった。

### 正規化と直接の系のテスト

**Economides。** 端点、線形輸送費率1、単位生産限界費用0、密度 \(\mu\)、費用 \(ca_i^2/2\) を用い、利得を \(\mu\) で割ると \(\lambda=c/\mu\)。式(1), (8)の分割枝は本稿の式(3), (4)の中段に一致し、式(9)による対称候補 \(A\) は **ABSORBED**。原論文p. 24は飽和需要そのものを既に定義するため、需要のクリッピングは既出。p. 23脚注4は厚い留保価格で全員購買を仮定し、現稿は外部選択なしと明記する。端点の式(3)では全品質対について各社の \(p_i-a_i\le1\) であり、\(k>2\) なら任意の片側価格逸脱の際にも据え置かれた相手製品が全消費者に正効用を与える。この意味で、式(3)の純粋価格均衡は十分高い有限の留保価値でも維持される。任意の不均衡価格対で被覆が成立するという主張までは含まない。原論文p. 28のアンダーカット判定は対称品質を固定した同一価格部分ゲームで行っている。品質を変え、価格部分ゲームを解き直した逸脱はその比較に含まれない。中段を延長しても、傾きが \(2/3\) から \(1\) へ上がる排除レントを回収できず、原定理から得られる短い系ではない。

**Bunte（1997）。** 輸送費率を \(t\)（原著 \(u\)）、品質上昇一単位二乗当たりの密度調整済み費用係数を \(\kappa\)（原著の費用係数）、元の品質上昇を \(q_i\) と置く。p. 104の式(8a,b)は対称立地・同じ初期品質では \([q_i-q_j+3t]^2/(18t)-\kappa q_i^2\)。\(a_i=q_i/t\)、\(p_i=(P_i-mc)/t\)、全利得を \(t\) で割ると \(\lambda=2\kappa t\)。中心枝FOCの自己二階条件は \(18\kappa t>1\)。局所反応の傾きは \(-1/(18\kappa t-1)\)、絶対値が1未満なら \(18\kappa t>2\)。当該安定性批判と分割枝は **ABSORBED**。例として本稿の \(\lambda=1/6\) では局所傾きが \(-2\) で、同時反応反復は局所不安定だが、式(8)による排除逸脱の差は \(-1/6\) で、対称純粋Nashが存在する。Bunteの§4、pp. 109–111は相手の地元への進出を阻む限界価格を両社に与える別シナリオで、p. 110はその価格対が静学Nashを構成しないと明記する。§8はSorensonに倣い端点に固定するが、初期品質差が十分小さいという条件下で§3の正販売量の価格式を引き継ぐ。制約にかかる比較や傾向だけから \(BR(B)=\{0\}\) は出ない。 [該当章](https://cris.maastrichtuniversity.nl/files/813351/guid-4c6cc7b3-08f2-4668-a315-0e792cca3ec5-ASSET1.0.pdf)

**最も強い吸収仮説。** P2またはP4が、初期品質差ゼロでも適用できる形で、大域的価格利得 \(G(d)=0,\,(1+d/3)^2/2,\,d-1\)（境界 \(\pm3\)）と非負品質の最適反応図を既に与えていれば、両角の検査、中心枝の連立一次式、二枝頂点の差の比較だけで本稿を再構成できる。結論に \(4/27\) の表記がなくても **ABSORBED** となり得る。価格分岐だけなら既知部品の可能性が残る一方、品質反応の必要十分性をすぐ導けるかは当該定理・定義域による。Bunte（1997）のSorensonに関する記述はこの検査を優先する根拠であり、Sorensonの命題そのものの証拠には使っていない。

**近接する既知の方法。** Wauthy（1996）pp. 347–351、Propositions 1–2は純粋垂直差別化で価格継続を分岐させ、品質選択の大域的比較を行う。第1の価格命題は排除も含む。効用は品質と嗜好の積を含み外部選択があり、上限の品質を選ぶ企業を含む命題である。BER掲載のLiao（2008）§§II, IV、Prop. 2は二次品質費用で領域別の最適反応と共存を扱う。正販売量を得る二社に限定し、被覆・非被覆の違いを扱う。両論文は方法と定性的な教訓を先取りするが、端点での対称共有の復帰と二つの排除均衡の持続を式の置換だけで与えない。 [Wauthy全文](https://dial.uclouvain.be/pr/boreal/object/boreal%3A47503/datastream/PDF_01/view) ／ [Liao全文](https://scholars.lib.ntu.edu.tw/server/api/core/bitstreams/f430a648-cc98-48fe-9a2a-e6cfd84035dd/content)

**残存する最小貢献。** 同質な企業が端点に固定されたEconomidesの品質継続について、両排除均衡の存続と \(4/27\) における共有均衡の追加を一つの純粋均衡対応として必要十分に示すこと。既存3著者を読んだ経済学者にとって独立した新知見かは **UNRESOLVED**。

## Report 3 — Independent Mathematical Audit

### 価格部分ゲームの存在と一意性

効用差は \(u_1(z)-u_2(z)=1+\delta-p_1+p_2-2z\)。境界消費者は高々一点で測度ゼロ。任意の品質差・非負価格に対し式(2)のクリップ需要が成り立つ。企業1の相手価格を \(q\)、自己価格を \(p\)、\(T=1+\delta+q\) と置く。収入は \(p[ (T-p)/2 ]_0^1\)。\(T\le0\) なら全ての非負価格がゼロ収入。\(T>0\) なら、全需要獲得区間では \(p\) に増加し、分割区間では厳密な凹二次式、売上ゼロ区間は最適値未満となる。従って一意の最適反応は \(\max\{T/2,T-2\}\)。境界 \(T=4\) では二式が同じ一点を与える。企業2は \(-\delta\) で同式。有限の捕捉逸脱もこの大域的最大化に含まれる。

1. **両社正販売量。** \(T_i>0\) なので双方の価格は正。分割枝のFOCを連立すると \((1+\delta/3,1-\delta/3)\)。両社正販売量と正価格は \(|\delta|<3\) を要求し、このとき両 \(T_i<4\) となって反応式を満たす。捕捉価格が実行可能なら企業1の候補収入から捕捉収入を引くと \((\delta-3)^2/18\)。企業2は \((\delta+3)^2/18\)。
2. **企業1が全販売量。** 企業2が正の利益を一切得られないためには \(1-\delta+p_1\le0\)、従って \(p_1\le\delta-1\)。企業1は捕捉を保つ限り価格を引き上げるので \(p_1=\delta+p_2-1\)。二つの条件から \(p_2=0,p_1=\delta-1\)。これが \(T_1-2\) の反応枝に入る条件は \(\delta\ge3\)。企業2単独の最適反応は全非負価格だが、相互最適反応では \(p_2=0\) のみ。
3. **企業2が全販売量。** 交換対称性で \((0,-\delta-1)\)、\(\delta\le-3\)。\(\delta=3\) では \((2,0)\)、\(\delta=-3\) では \((0,2)\) が唯一。いずれも同点購入者は測度ゼロ。以上で式(3)は全履歴で一意の純粋価格均衡。

Lemma 1は存在の明示にとどまり、Appendix Aの候補排除は \(|\delta|>3\) に重点がある。上の反応式を使うと \(|\delta|<3\) の別の片側捕捉候補と境界をまとめて排除できる。**MAJOR BUT FIXABLE（証明の橋渡し）**。独立証明で埋まり、数理的な反例や理論変更は発生していない。

### 品質均衡の必要十分性

価格を代入した粗収入は、差 \(d=a-b\) について \(0\)（\(d\le-3\)）、\((1+d/3)^2/2\)（\(-3\le d\le3\)）、\(d-1\)（\(d\ge3\)）。二次品質費用を引くと式(4)。両境界で連続。限界粗収入は \(d=-3\) で両側ゼロ、\(d=3\) で \(2/3\) から \(1\) に上がる。従って \(a=b+3\) の内点の折れは局所最大になれない。\(a=b-3>0\) では傾きは \(-\lambda a\)。

- **相手品質0。** \([0,3]\) で \(1/3+(1/9-\lambda)a>0\)。第三枝には唯一の頂点 \(B=1/\lambda>3\) があり、境界3に対する利得差は \((1-3\lambda)^2/(2\lambda)>0\)。従って \(BR(0)=\{B\}\)。
- **相手品質 \(B\)。** \((0,B-3]\) はゼロ販売で負の利得。分割枝の初期傾き \(-\lambda(B-3)\) は負で以後さらに減る。逆排除枝 \(a\ge B+3\) は頂点 \(B\) より右なので減少。従って \(BR(B)=\{0\}\)。これでゼロ品質を含む均衡は両角だけ。
- **両社品質が正。** ゼロ販売なら品質を0へ戻して費用を節約し、粗収入は非負。従って \(|a-b|<3\) が必要で、式(7)の二本を引くと \((9\lambda-2)(a-b)=0\)。域内では \(a=b=A=1/(3\lambda)\)。品質が正の非対称共有、正品質を選ぶ被排除企業、価格切替点上の均衡を同時に排除する。
- **相手品質 \(A\)。** \(A<3\) のためゼロ販売枝は実行域外。分割枝と排除枝の厳密な凹最大はそれぞれ \(A\) と \(B\)。後者は \(B-A>3\) により実行可能。\(v(B,A)=1/(6\lambda)-1\)、\(v(A,A)=1/2-1/(18\lambda)\)。差は \((4-27\lambda)/(18\lambda)\)。等号では \(A=9/4,B=27/4\)、\(BR(A)=\{A,B\}\)。\(BR(B)=\{0\}\) と内点必要条件により、\((B,A)\) 等は均衡にならない。他の価格継続の選び方に起因する追加純粋均衡もない。

端点 \(\lambda=1/9\) では分割枝の曲率が消え、\(\lambda=2/9\) では対称性の消去係数がゼロになる。後者では \((7/5,8/5)\) が共有均衡になることを各枝の厳密最大化で確認した。これは定理の開区間を閉区間にしてはいけない具体例。混合価格継続の存在・一意性と混合品質均衡はこの監査の射程外。

### 計算とLeanの証拠範囲

確定コミットの `verify_exact.py` はPythonとSymPy 1.14.0で再実行し、同梱ログと同じ3行を得た。独立実装は効用由来の需要を直接使って価格反応の固定点を検査し、境界間の3点から有理数で各品質枝の曲率・頂点を復元した。定理全域の保証は上の解析証明に基づく。104,618回の価格逸脱比較と、40費用・3,416相手品質点を探索した。境界を含め域内の追加均衡を発見しなかった。実行出力と独立コードは末尾に掲載した。

`ShortNoteFormal.lean` は \(x=\lambda a,y=\lambda b\)、利得の倍率 \(18\lambda^2\) で式(4)に一致する。たとえば中枝は \((3\lambda+x-y)^2-9\lambda x^2\)。`BR` は全実数の非負逸脱に量化し、`complete_pure_quality_NE` は \(1/9<\lambda<2/9\) のもとで両角と条件付き対称点の同値を述べる。対象ソースに `sorry`、`admit`、独自 `axiom` の字面は見つからず、対象定理に `#print axioms` がある。Lean `v4.33.1`、mathlib `v4.33.1`（解決済み `0df444a360eaa60ab8c11dca51a86af692955474`）。ローカルにLean/Lake/Elanがなく、配布先への接続もタイムアウトした。指定コミットのActions実行一覧は0件。したがって独立カーネル再ビルドと推移的な公理の再認証は **UNRESOLVED**。従前の証明書は `EconomidesFormal` の広い旧稿の証明範囲も含むため、BER確定コミットの新規カーネル証拠と混同しない。価格・需要・立地・混合戦略は `ShortNoteFormal` の符号化の外にある。 [Leanソース](https://github.com/ryotamatsuki/economides-quality-equilibrium-reassessment/blob/ba13033d27ac5106f7d5f845239f80a826bb4974/ShortNoteFormal.lean)

## Report 4 — Model–Question Alignment Audit

| 攻撃 | 対象・実行した検査 | 所見と最強反論 | 深刻度・差し戻し |
|---|---|---|---|
| Generic Model in Disguise | pp. 2–3 式(2)–(5)。水平立地を \(h=2z-1\sim U[-1,1]\) のブランド選好差に写像。効用差は \(a_1-p_1-(a_2-p_2)-h\)。Wauthyの分岐命題と照合 | 立地語を除いた同じ縮約ゲームが存在し、幾何学自体の新規性はない。最強反論は、共通嗜好の品質投資と加法的ブランド愛着が共有と排除を共存させる正確な対応は、Wauthyの乗法型効用・外部選択から直ちに出ないこと | **UNRESOLVED**。別の理論を作る前にStage 6で近接原文を検査 |
| Research Question–Model Mismatch | p. 1 要旨・導入、p. 2末、p. 4末。端点に固定する条件と大域的価格の全履歴を対応づけ、P1のTheorem 2と照合 | 現稿の限定は正確。端点での対称継続を反証しても、全ゲームの均衡を置換しない。また、近接立地・同品質の純粋価格均衡不存在は先行する別の障害。最強反論は、端点の実際の均衡構成にはその障害とは別の情報があること | 射程内はPASS。比較上の強調に **MINOR**、Stage 7.5A / 10B |
| Nonessential Thematic Primitive | pp. 2–4 式(1)–(8)。端点二次輸送費、品質上限、品質・価格同時選択の三つを解析・有理数で比較 | 二次輸送費でも端点で全需要が同一。上限が小さい場合と同時手番では結論が崩れる。反論は端点の需要差とタイミングが経済的に解釈できること | **LIMITED**。分類の提示はStage 7.5A。科学的修正は射程を広げて主張するときに限る |
| Insufficient Economic Learning | p. 4の比較静学を \(B-1\) の価格、二社の販売有無、均衡支持集合で再解釈 | 費用高でも排除は消えず、市場シェア \((1,0),(0,1)\) に \((1/2,1/2)\) が加わる。質・価格の数値は費用とともに動き、戦略プロフィールの集合が包含されるという字義は不正確。選択確率や厚生は決まらない。反論は市場構造を「実現可能な均衡の範囲」として確定した点 | **MAJOR BUT FIXABLE**（経済学的な価値判定）、Stage 6 / 7.5。集合表現はStage 10Bで限定修正 |
| Alternative Model Challenge | p. 3定理1。二つの厳密な非対称均衡は二行動の反協調で再現可能。Wauthy Prop. 1–2とLiao Prop. 2も跨領域比較を実行している | 反協調は直観を説明するが、三種類の品質水準、同質企業の対称共有、排除との共存への費用閾値を導かない。先行する価格分岐を二次費用に合わせるだけで足りるという反論は、P2・P4の既存反応式次第 | **UNRESOLVED**、Stage 6。数値閾値の独自性だけで切り返さない |

### 機構の反実仮想と射程

| 要素 | 分類 | 判定根拠 |
|---|---|---|
| 品質の価格に対する先行コミットメント | **ESSENTIAL**（検査した同時手番との比較） | 同時手番で基準の排除プロフィール \((B,B-1)\) 対 \((0,0)\) を置くと、敗者が \((a,p)=(\epsilon,\epsilon/2)\) へ移り、微小 \(\epsilon>0\) で純増 \(\epsilon^2(1/8-\lambda/2)>0\)。元の全区間で角均衡は崩れる |
| 価格ゲームの共有・排除切替 | **ESSENTIAL**（全市場捕捉を含む分類） | \(Q_{\max}=2\) では \(|d|\le2\) で価格切替不可。元の低費用域内の \(\lambda=1/7\) で \((2,2)\) は共有均衡。自己の分割枝利得は相手品質2に対し区間 \([0,2]\) で上昇する |
| 二次品質費用 | **CONTRIBUTORY** | 枝内の曲率・内点の線形式・数値閾値を決める。他の厳密凸費用での全分類は未検証 |
| 固定端点の立地 | **CONTRIBUTORY** | 両端で効用差が消費者型についてアフィンとなる。内側の近接立地では同品質でも価格ゲームの純粋均衡が存在しない履歴がある。端点以外への一般化は未検証 |
| 線形の輸送費形状 | **INTERPRETIVE**（固定端点では） | \(z^2-(1-z)^2=2z-1=z-(1-z)\)。強制購買のもとで二次輸送費に替えても全価格・品質の需要が同じ。内側立地や外部選択付きへの延長は未検証 |
| 品質の非負性と上限 | **CONTRIBUTORY** | 0が退出に相当する品質境界を与え、低い上限は結果を崩す。一方、粗収入の片側傾きは全枝で高々1なので \(a>B\) の利得は厳密減少。共通上限9でも元の全区間で分類を保存でき、無上限は結論に本質的でない |

**Stage 7.5Aの射程。** 二つ対三つの対応は **MODEL-SPECIFIC**。強制購買の固定端点で効用差を維持する輸送費形状・ブランド選好解釈への写像は **CONDITIONALLY PORTABLE**。新しい形の需要、外部選択、混合均衡、立地選択、品質費用の政策効果への一般化は **UNRESOLVED**。当該純粋価格ゲームの一意性は品質段階の選択依存を除く。均衡比較の対象は、質・価格の実現値そのものより、各費用での市場構造と参加形態の支持集合である。

**三段階ゲームへの別の障害。** d’Aspremont, Gabszewicz and Thisse（1979）pp. 1146–1147の命題を単位区間・左右対称立地 \((3/8,5/8)\)・同品質の履歴に適用すると、唯一の内点候補は \((1,1)\)。一社は \(3/4\) をわずかに下回る価格で全需要を取れ、候補収入 \(1/2\) を超える。境界候補は同命題により排除される。同履歴が許される原始ゲームに厳密な純粋SPNEを求める場合、全ての費用で別途障害になる。これは本稿の端点定理の反例ではなく、端点で失われる市場構造を訂正短報の中心に置く理由になる。 [1979年論文の命題・証明](https://www.rasmusen.org/GI/reader/14c.Dasprement%2Cgab%26Thisse.pdf)

## Report 5 — Four Referee Reports

### Referee A — Industrial Organization / Novelty — Reject

p. 2の既存研究の扱いは慎重で、p. 3式(5)は原Theorem 2より多くを示す。経済的には企業間の異質性がなくても二つの排除があり、費用増加が参加形態の選択肢を増やす。だがBunte（1997）pp. 104–106の局所批判と、同pp. 122–123がSorensonに帰属する固定端点の仕様を踏まえると、先行研究が大域的反応のどこまでを既に持つかを特定する必要がある。P2・P4の原文で必要十分性か直接の系かを検査するまでは、p. 2で優先権の主張を控えるだけでは外部査読に付す差分を認定できない。

### Referee B — Game Theory / Mathematical Correctness — Minor Revision

p. 2式(2)から価格の単独反応を直接解いた結果、すべての \(\delta\) で式(3)が唯一の純粋価格均衡。p. 3の候補の必要性と、pp. 4–5 Appendix Bの大域的十分性は成立。\(4/27\) で企業が単独で \(B\) に逸脱して無差別でも、相手の \(BR(B)=\{0\}\) により追加均衡は生じない。p. 2 Lemma 1の主張を一意性まで明示し、p. 4で捕捉企業の最高捕捉価格と被排除企業の正利得不能条件を並べれば、本文の継続値が選択に依存しない根拠になる。数学査読としての推薦であり、同値定理が未確認の段階で掲載を認める意味はない。

### Referee C — Mechanism / Scope — Major Revision

p. 3式(4)の粗収入の傾きが \(2/3\) から1へ跳ぶことがメカニズム。反実仮想では同時手番で敗者が価格も変えると角均衡が崩れ、低い品質上限で共有が復活する。線形輸送費そのものは端点で二次と需要同値。p. 4は立地・厚生・選択を限定できているが、費用上昇が「集合を拡大」とすると戦略水準の移動を隠す。同じ費用で共存する市場構造の種類を述べ、原論文への訂正を固定端点の継続予測の訂正として位置づける。新たなモデル拡張は不要。BERに通用する知見の重みはStage 6 / 7.5に戻す。

### Referee D — BER Editor / Exposition — Reject

p. 1の平易な問い、p. 2で閉じた定義、p. 3の一つの定理、付録A–Bの分担は短報として合理的。読者がつまずくのはp. 2で縮約利得の前提となるLemma 1が “a pure price equilibrium is” と存在形で提示される点と、p. 4の帰結がp. 2の結果要約を繰り返す点。より重大なのは、専門読者が理解できることと、BERの幅広い読者に独立した貢献が伝わることの隔たり。旧ETB稿の定理を現稿も維持しているので、説明改善による新たな科学的差分は確認できない。

### Stage 12 — BERとの適合性

Wiley公式規定は、理論原稿に加えて査読付き短報・ノート・コメントを対象とし、独創性・実質的貢献・幅広い経済学者の関心を求める。現稿の約129語の要旨は150語以内でJEL・キーワードもある。著者の郵送先表記、別ファイルの申告・補足資料、現行ポータル入力と投稿書簡末尾の著者用内部注は正式Stage 14で確認する。6頁は証明量に見合う。内点の価格存在を示してAppendix Aに任せる現行配置を維持しつつ、Lemmaで一意性を明示する修正は短くできる。 [BER公式著者ガイド](https://onlinelibrary.wiley.com/page/journal/14678586/homepage/forauthors.html)

本文確認の主比較はLiao（2008）pp. 27–44。§Iが先行稿Wauthyの予測と論文の独自変更を隣り合わせに置き、§IIが価格市場構造を列挙、§IVが価格分岐を越える品質逸脱を比べ、Prop. 2で共存を区切る。Props. 2–3とAppendices B–Dで計算・厚生への接続が追える。Liaoは一社排除を除く別モデルで、Prop. 2の閾値にシミュレーションを含む。本稿のp. 3の解析的弱閾値と全代替候補の排除は証明の透明性で比較し得る。本稿のp. 2の文献比較は、最も近い二つの定理との差分を特定できていない。Wang（2003）pp. 91–99の短い差別化ノートは出版社要旨のみ確認したため形式例に限った。現行基準に照らし**外部査読に送付しない**。 [Liao全文](https://scholars.lib.ntu.edu.tw/server/api/core/bitstreams/f430a648-cc98-48fe-9a2a-e6cfd84035dd/content) ／ [Wang出版社要旨](https://onlinelibrary.wiley.com/doi/pdf/10.1111/1467-8586.00163)

近年の補助比較はPaul and De（2026、BER 78, pp. 242–260）。出版社版では要旨・掲載情報を確認し、2023年公開稿で導入・Proposition 1・付録の証明を読んだ。上流の一律価格と差別価格を比較し、下流競争方式による最適民営化の順位逆転を制度差へ結び付ける。現稿の一低一高の品質対応と同値ではない。経済的な比較の対象と、その順位に効く制度条件を導入で対にして示す例として参照した。公開稿と掲載版の番号・証明が同一かは未確認。 [BER掲載版書誌](https://onlinelibrary.wiley.com/doi/10.1111/boer.70018) ／ [公開稿](https://mpra.ub.uni-muenchen.de/118590/11/Main%20document_30aug23.pdf)

**説明面だけでの最強の不採択理由。** p. 2の価格補題が存在形でp. 3の縮約ゲームが単値と読めるため、何が論理的に済んだかを読者が付録を使って補わなければならない。同ページでは既出の安定性と本稿で初めて独立に示したい結果が優先権の留保と一緒に語られ、比較が定理単位で見えない。参照箇所の明示と証明の短い橋渡しで説明面は回復できる。掲載価値の判断は文献の科学的監査に依存する。

### Phase E — 旧ETB稿との照合

旧6頁稿に対応する公開TeXを照合した。二つの排除均衡、\(4/27\) での等号、純粋品質均衡の完全性が旧稿にもある。BER稿の主要な変更は問い・機構・経済的解釈の説明にあり、新たな均衡結果は確認されない。 [旧ETB比較元](https://github.com/ryotamatsuki/economides-quality-equilibrium-reassessment/blob/867d11c41a4a65330917c691fc1b6492e72ef195/paper/etb/main.tex)

## Report 6 — Editorial Decision Letter

*Simulated editorial correspondence*

Dear Dr Matsuki,

Thank you for submitting “Quality Differentiation and Market Exclusion: A Note on Economides (1989).” I have decided to decline the manuscript without sending it for external review.

The note establishes a complete pure-strategy quality-equilibrium correspondence at fixed endpoint locations. It shows that a finite investment deviation can remove symmetric market sharing even though two equilibria with market exclusion survive. This is a precise result, and the distinction between local adjustment stability and global Nash optimality is valuable. The question for the Bulletin is what the result adds to the closest work on quality investment in this same setting. The manuscript leaves open whether the global best replies in Bunte or Sorenson already yield the correspondence after normalization. The existing stability critique and established work on comparing price regimes make that question central to the editorial decision. The narrow scope of the theorem also limits the claim that it revises the original location prediction. Its strongest implication concerns the endpoint continuation, while the familiar difficulty with pure pricing at nearby locations is separate. An exact cutoff and a self-contained proof make the note clear and verifiable, but the present evidence does not establish a distinct result of sufficient interest to the Bulletin’s broader readership.

Sincerely,

Handling Editor  
*Bulletin of Economic Research*

### Strongest author response

A complete equilibrium correspondence answers a different question from whether the symmetric profile is locally stable or whether one large deviation defeats it. The original theorem predicts symmetric quality and shared sales over the entire stated cost interval. Within that very interval our global analysis establishes that the market can tip to one supplier even when the firms are identical and fixed at maximally differentiated varieties. More importantly, greater investment costs do not reverse that market structure. They make symmetric sharing feasible while leaving both exclusion equilibria in place. This distinction is lost in a local calculation and also in an analysis that proves only failure of the symmetric candidate. Our proof excludes any other pure quality profile and resolves indifference at the threshold explicitly. The result is therefore a tightly scoped correction with a determinate prediction about the set of sustainable market structures, a question relevant to economists studying the effects of lower investment costs. To substantiate its distinctness, we would supply a theorem-level comparison with Bunte and Sorenson, showing exactly which branching payoffs and equilibrium conditions they establish and why the full correspondence does or does not follow from them.

**反論の監査。** 前半の経済学的・数学的主張は式(3)–(8)と独立証明に裏付けられる。末尾の約束に対応する証拠は未取得。Bunte（1997）との比較だけで競合先二つを代表させることはできない。反論は外部査読への送付を再考する条件を示すが、現時点の却下理由を解消しない。

## Report 7 — Revision Priority Matrix

| 優先 | 指摘 | 深刻度 | 根拠 | 必要な対応 | 最初の差し戻し |
|---|---|---|---|---|---|
| 1 | P2/P4と定理1の同値性が不明 | **UNRESOLVED**。完全吸収なら **FATAL** | p. 2、Theorem 1、Bunte第3章pp. 106, 122–123 | 原文を取得し、全領域価格、品質境界、初期品質差ゼロ、分岐間比較、角の排除を式で写像 | **Stage 6**。実質吸収ならStage 2へ |
| 2 | BERとしての経済学的価値が限定的 | **MAJOR BUT FIXABLE**。独立した価値が立たなければ当該案は **FATAL** | p. 4、旧ETB稿、BER基準とLiao Prop. 2 | 独立性が残った場合、端点における市場構造の支持集合の含意を既知の安定性批判・近接立地問題から切り分けて再評価 | **Stage 6 / 7.5**、その後Stage 12 |
| 3 | Lemma 1から単値の価格継続への橋渡し | **MAJOR BUT FIXABLE** | pp. 2–4、Eq. (3)–(4)、Appendix A | 大域的価格反応式または両領域・等号での一意性を明記し、最適反応が集合になる敗者の例も相互反応で解決 | **Stage 4A**で証明確認済み、原稿反映はStage 10B / 13 |
| 4 | 均衡集合の「拡大」の表現 | **MINOR** | p. 2冒頭、Eq. (5) | 費用間で共通するのは排除という均衡の型。品質水準は \(A,B\) とともに動くことを表現に反映 | **Stage 7.5A / 10B** |
| 5 | Leanの独立再ビルド | **UNRESOLVED** | p. 5 Appendix C、指定SHAのCI履歴 | 既存カーネル証明の再認証をうたう場合、ピン留めした環境でビルドと `#print axioms` を記録 | **Stage 7.5A** |
| 6 | 書簡・郵送先・申告・ポータル照合 | **MINOR**／正式QA前 | p. 1、pp. 5–6、書簡末尾、Wiley公式 | 著者用末尾注を投稿用版から除き、申告・添付・ポータルを再照合 | **Stage 14 / 15** |

**CERTIFICATION REGRESSION。** 旧Stage 17記録は既にP2/P4を未解決とし、投稿操作や新規性PASSを条件付き評価から除いていた。確認できた記録に「新規性認証の失敗」はない。今回の形式証明再実行は未認証。数学的反例は域内で見つからず、Stage 7.5Aの旧証明書は旧稿の「少なくとも二つ」までの主張なので、本稿の完全性は今回の独立証明で照合した。価格一意性の説明は **証明提示上の回帰事項** として記録する。 \(\lambda=2/9\) の反例は新規な範囲外チェックで、現稿の記述が範囲を逸脱したものではない。

## Report 8 — Pre-Submission Scientific Risk Brief

**最も強い不採択理由。** 既に知られた局所不安定性、分岐価格、排除の可能性に対し、追加の完全分類が独立した定理か特定できていない。さらに、既知の近接立地での純粋価格均衡不存在があるため、Economidesの全ゲームに対して反証を一つ追加しただけという説明では、BER基準に照らして弱い。

**最も強い反論。** 端点は元の予測が指定した立地であり、そこでの品質費用が下がると対称共有だけが消え、両社がそれぞれ排除企業になる純粋均衡は残る。反対方向の費用変化でも排除を取り除かず、共有を追加する。この知見は原定理の内点計算とBunte（1997）の局所反応条件では導けない。競合する二つの初期文献への反論は未完成。

**数学上の残り。** 基準の端点定理に未解決の反例なし。価格の一意性には上記の短い導出を掲載できる。混合継続・内生的立地・一般的輸送費・外部選択を含む主張は支えられていない。Leanの独立カーネル再実行とETB実提出PDFとの同一性は未確認。重要度が最も高い未実施検査はBunte（1995）及びSorenson（1995）の全文の同値性照合。

| 再開条件 | 合格条件 | 不合格・停止条件 |
|---|---|---|
| 1. Stage 6で一次資料による吸収判定 | P2・P4の本文・証明を入手し、同じ戦略域と費用単位に写像した上で、定理1に必要な実質的追加推論を文献ごとに特定 | 同一または直接の系なら **NO-GO**。原文が依然未確認で重複警戒が解消しない場合も投稿保留 |
| 2. Stage 7.5 / 12で経済学的価値を再判定 | 先行研究と差し引きした結果が、端点での市場全体の構造に与える独立した知見を一文で示し、Liaoなどとの具体比較を踏まえ編集者が外部査読へ送る根拠を立てられる | 証明の自足性、既知の局所批判、数値閾値の違いしか残らない場合、本稿のBERルートは **NO-GO** |
| 3. 証明表現と射程を確認 | 純粋価格継続一意性・切替点・型の比較を最小限の補修で明示し、証明とLean実行の範囲を一致させる | 追加の価格継続・品質均衡が出る、または全ゲームや混合均衡の過大主張が残る場合はStage 4A / 7.5Aに戻す |

**Stage 11の正式判定は REOPEN EARLIER STAGE / NO-GO。BERへの現稿投稿は見送り。** 当面の差し戻し先はStage 6。CRIEFF 9509は発行機関の保有冊子・図書館経由、Sorensonは購読機関の全文を優先する。文献の結果次第で、現稿を限定修正して再査読へ回すか、同じ貢献の投稿を終えるかを決める。今回の監査でStage 13–15の完成稿・技術・著者承認は認証していない。

## 付録 — 計算結果と再現コード

Python 3、SymPy 1.14.0。先に独立実装の動作を確認し、その後で著者のスクリプトを再実行した。分数の有限サンプルを厳密計算しており、表の探索数は連続戦略空間の完全探索を意味しない。

### 確定コミットの著者スクリプト

```text
PASS: branch continuity, slope jump, price capture squares, exact gain, cutoff equality, local response slope
PASS: 6 exact lambda regimes; 294 rational rival-quality grid points; 11 price gaps and 4411 price alternatives per player
SCOPE: exact identities plus sampled global checks; analytic proof gives exhaustive all-quality claim; Lean not rerun
```

### 独立スクリプトの結果

```text
Exact exclusion gain: -(27*L - 4)/(18*L)
Exact gross marginal slopes on either side of +3: 2/3 1
289 exact price gaps × 181 sampled deviations × 2 players: 104618
40 exact quality costs, 3416 rival-quality points; no extra equilibrium found
Outside theorem: at lambda=2/9, (7/5,8/5) is an additional sharing equilibrium.
Bounded quality counterfactual: Qmax=2, lambda=1/7, (2,2) shares market.
```

### 独立スクリプト

```python
"""Exact independent check from consumer allocation and price best replies."""
from fractions import Fraction as Q
from itertools import product
import sympy as s


def clipped_share(delta, own, other):
    return max(Q(0), min(Q(1), (1 + delta - own + other) / 2))


def unique_positive_revenue_price(intercept):
    return max(intercept / 2, intercept - 2) if intercept > 0 else None


def price_continuation(delta):
    candidates = [(1 + delta / 3, 1 - delta / 3), (delta - 1, Q(0)),
                  (Q(0), -delta - 1)]
    matches = set()
    for p, q in candidates:
        if min(p, q) < 0:
            continue
        br_p = unique_positive_revenue_price(1 + delta + q)
        br_q = unique_positive_revenue_price(1 - delta + p)
        if (br_p is None or p == br_p) and (br_q is None or q == br_q):
            matches.add((p, q))
    assert len(matches) == 1, (delta, matches)
    return matches.pop()


def payoff(cost, own, other):
    p, q = price_continuation(own - other)
    return p * clipped_share(own - other, p, q) - cost * own**2 / 2


def quality_best_replies(cost, rival, cap=None):
    boundaries = [Q(0), max(Q(0), rival - 3), rival + 3]
    if cap is not None:
        boundaries = [min(cap, p) for p in boundaries] + [cap]
    candidates = set(boundaries)
    # On each interval estimate the quadratic from three direct-payoff evaluations.
    for lo, hi in zip(boundaries, boundaries[1:] + [None]):
        if hi is None and cap is not None:
            continue
        step = (hi - lo) / 2 if hi is not None else Q(1)
        if step <= 0:
            continue
        f0, f1, f2 = [payoff(cost, lo + i * step, rival) for i in range(3)]
        curvature = (f2 - 2 * f1 + f0) / step**2
        slope = (f1 - f0) / step - curvature * step / 2
        if curvature < 0:
            x = lo - slope / curvature
            if x > lo and (hi is None or x < hi):
                candidates.add(x)
    best = max(payoff(cost, x, rival) for x in candidates)
    return {x for x in candidates if payoff(cost, x, rival) == best}


L, d = s.symbols('L d', positive=True)
A, B = 1 / (3 * L), 1 / L
p_share = 1 + d / 3
assert s.factor(p_share * (1 + d - p_share + 1 - d / 3) / 2
                - (1 + d + 1 - d / 3 - 2)) == (d - 3)**2 / 18
gain = (B - A - 1 - L * B**2 / 2) - (s.Rational(1, 2) - L * A**2 / 2)
assert s.simplify(gain - (4 - 27 * L) / (18 * L)) == 0
print('Exact exclusion gain:', s.factor(gain))
print('Exact gross marginal slopes on either side of +3:', s.Rational(2, 3), 1)
for delta in (Q(i, 12) for i in range(-144, 145)):
    p, q = price_continuation(delta)
    for signed_delta, own, other in [(delta, p, q), (-delta, q, p)]:
        assert all(own * clipped_share(signed_delta, own, other) >=
                   alt * clipped_share(signed_delta, alt, other)
                   for alt in (Q(i, 12) for i in range(181)))
print('289 exact price gaps × 181 sampled deviations × 2 players:', 289 * 181 * 2)
costs = sorted({Q(i, 360) for i in range(41, 80)} | {Q(4, 27)})
profiles = 0
for cost in costs:
    a, b = 1 / (3 * cost), 1 / cost
    grid = {Q(i, 8) for i in range(81)} | {a, b, a + 3, b - 3, b + 3}
    br = {rival: quality_best_replies(cost, rival) for rival in grid}
    assert br[Q(0)] == {b} and br[b] == {Q(0)}
    cut = Q(4, 27)
    assert br[a] == ({b} if cost < cut else {a, b} if cost == cut else {a})
    found = {(x, y) for y, replies in br.items() for x in replies
             if y in (br[x] if x in br else quality_best_replies(cost, x))}
    expected = {(b, Q(0)), (Q(0), b)}
    if cost >= cut:
        expected.add((a, a))
    assert found == expected, (cost, found)
    profiles += len(grid)
print(f'{len(costs)} exact quality costs, {profiles} rival-quality points; no extra equilibrium found')
assert quality_best_replies(Q(2, 9), Q(7, 5)) == {Q(8, 5)}
assert quality_best_replies(Q(2, 9), Q(8, 5)) == {Q(7, 5)}
print('Outside theorem: at lambda=2/9, (7/5,8/5) is an additional sharing equilibrium.')
assert quality_best_replies(Q(1, 7), Q(2), cap=Q(2)) == {Q(2)}
print('Bounded quality counterfactual: Qmax=2, lambda=1/7, (2,2) shares market.')
```
