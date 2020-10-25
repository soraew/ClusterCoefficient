# ClusterCoefficient
無向グラフのクラスター係数を求めるアルゴリズムを、julia で実装したもの.
cluster_coefficient.jlとgraphs.jlを同じフォルダ内に入れてcluster_coefficient.jlを実行すると、

```shell
❯ julia cluster_coefficient.jl
Cluster value for each node = [0.4, 0.333, 0.381, 0.1, 0.333, 0.667, 0.333, 0.333, 0.5, 0.333]
Cluster value for graph = 0.371
```

のようにしてそれぞれのノードのクラスター係数と、グラフ全体のクラスター係数が出力され、以下のようなグラフが
"graph.png"に保存される.

(ノードの色が濃いほどクラスター係数が大きいように表示される)

![graph](https://github.com/soraew/ClusterCoefficient/blob/main/graph.png)


