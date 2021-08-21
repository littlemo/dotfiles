try:
    import numpy_financial as npf

    def RATE(nper, pmt, pv, fv=0, when='end', guess=None, tol=None, maxiter=100, multiple=1) -> float:
        """
        计算等额本息下贷款的每期利率

        >>> RATE(10, -12, 100)
        0.034601537996533246

        :param int nper: 年金的付款总期数
        :param float pmt: 每期的付款金额，在年金周期内不能更改。通常，pmt 包括本金和利息，但不含其他费用或税金。
        :param float pv: 现值即一系列未来付款当前值的总和。(暂未实现)
        :param float fv: 可选，默认为 0 。未来值，或在最后一次付款后希望得到的现金余额。如果省略 fv，则假定其值为 0（例如，贷款的未来值是 0）。
        :param int multiple: 可选，打印利率输出时的期数倍数，如计算结果为每月，则 12 倍则为年化利率
        :rtype: float
        :return: 等额本息下贷款的每期利率
        """
        val = npf.rate(nper, pmt, pv, fv, when, guess, tol, maxiter)
        val *= multiple
        print('等额本息下贷款的每期利率: {:,.2%}'.format(val))
        return val

except ImportError as ex:
    print('跳过利率计算方法初始化，未找到相关依赖包: {ex}'.format(ex=ex))
