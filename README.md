# [ポケじゃん]

## サービス概要
ポケじゃんはポケモンのタイプ相性で、ランダムで選ばれたポケモンとじゃんけん感覚で対戦をするアプリです。
勝利するとポケモンをゲットすることができ、対戦で使用・図鑑を埋めることができます。
成績上位のユーザーはランキング画面で表示されるので、誰でも１位になる可能性があり気軽に楽しめるアプリです。


##　想定されるユーザー層
* ポケモンが好きな人
* ポケットモンスター スカーレット・バイオレットのランクマッチを「難しそう・時間がない」などの理由でできていない人

## サービスコンセプト
私はポケモンが好きで、よくオンライン対戦で順位を競うランクマッチで遊びます。
とても楽しくプレイしているのですが、ポケモンのランクマッチをしていて以下の点で課題を感じることもあります。

* 対戦を始めるまでに時間がかかる
ポケモンのランクマッチで対戦を行う場合、厳選が必須であり育成を完了するまでに時間がかかります。また、パーティ6匹の構築を考える・修正を行うことにも時間がかかるので、社会人や子育てをしている方などの時間がない人は対戦を行うまでの時間を作ることが難しいのではないかと感じました。

* 初心者にとって少し難しい
ポケモン対戦では、「このポケモンはこの技を覚える」や「このポケモンはこういう型がある（型というのはそのポケモンがどんな育て方をしてるかということ）」ということを知っていると知っていないとで勝率がかなり違います。
知識があれば対策が取れるため対戦を有利に進めることができますが、知らないと相手のポケモンに好き放題されて負けてしまうということもあります。
また同じポケモン、構築を使用しても上級者と初心者ではプレイングに差が出るため、ランキング上位の構築を使用しても勝てないということが起こります。
何回も対戦を重ねることで、知識やプレイングが上達することはポケモン対戦の魅力ですが、その楽しさを感じれる前に挫折したり飽きる人もいると感じました。

* 好きなポケモンで勝つことが難しい
ポケモン対戦での一番の理想は、好きなポケモンで勝つということです。
好きなポケモンがカイリューやハバタクカミなどの強いポケモンであれば可能ですが、すべてのポケモンが強いわけではなく進化前のポケモン（ニャオハやポッチャマ）はなかなか活躍させてあげることができません。
進化前のポケモンでも平等に戦えることができれば、自分の好きなポケモンで勝てるという楽しみがより簡単に感じれるのではないかと考えました。

これら三つの課題からポケモンの対戦をタイプ相性だけで行えば、じゃんけんのような感覚で誰でも簡単に対戦を楽しむことができ、どのポケモンでも平等に活躍できると思いこのアプリを考案しました。
また、この対戦システムではユーザーはすぐに飽きてしまうのではないかと感じたので、以下二点の機能をつけることで継続的に楽しめるようになっています。
* 対戦結果でレートが変動し、成績上位のユーザーはランキング画面に表示されます。
* 相手のポケモンに勝てばそのポケモンをゲットでき、引き分けの場合も確率でゲットできるようにすることで、対戦を重ねるほどたくさんのポケモンを集めることができます。


## 実装を予定している機能
### MVP
* 会員登録
* ログイン
* ポケモン一覧
* ポケモン登録（最初の1匹）
* ポケモン検索
* 図鑑登録
* 図鑑一覧
* ボックス一覧
* 対戦時使用ポケモン登録
* 対戦機能
* 対戦回数制限（1日5回予定）
* ポケモン登録機能（対戦勝利・引き分け時）
* レートランキング
* ポケモンゲット時 X投稿機能



### その後の機能
* レートリセット機能（管理者側で一定期間でランキング確定・リセット）
* リボン機能（ランキング上位者や図鑑が埋まったユーザーにリボンを与えてプロフィール画面で見れる）
* ボックスリセット機能
* 使用タイプランキング機能（ユーザーが使用してるポケモンのタイプで多いものをランキングで表示することでそのタイプに強いタイプを使用すれば勝利しやすくなるという、MVPリリース時の運ゲーすぎるゲーム性を少しマシにするための機能）
* テスト機能(RSpec)