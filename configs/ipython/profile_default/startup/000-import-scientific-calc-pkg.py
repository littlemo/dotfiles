try:
    import numpy as np
    import pandas as pd
    from pandas import DataFrame, Series
except ImportError as ex:
    print('跳过科学计算依赖包加载，未找到相关依赖包: {ex}'.format(ex=ex))
