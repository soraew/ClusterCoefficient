# ClusterCoefficient
無向グラフのクラスター係数を求めるアルゴリズムを、julia で実装したもの.
cluster_coefficient.jlとgraphs.jlを同じフォルダ内に入れてcluster_coefficient.jlを実行すると、

```shell
❯ julia cluster_coefficient.jl
j cluster_coefficient.jl
Cluster value for each node = [0.476190464852608, 0.4999999750000012, 0.399999980000001, 0.3333333055555579, 0.47222221566358036, 0.42857142091836753, 0.5238095113378688, 0.5333333155555561, 0.6999999650000017, 0.3333333287037038, 0.399999980000001, 0.99999950000025, 0.4642857059948981, 0.3333333055555579]
Cluster value for graph = 0.493
```

のようにしてそれぞれのノードのクラスター係数と、グラフ全体のクラスター係数が出力され、以下のようなグラフが
"graph.png"に保存される.

(ノードの色が濃いほどクラスター係数が大きいように表示される)

![graph](https://github.com/soraew/ClusterCoefficient/blob/main/graph.png)


