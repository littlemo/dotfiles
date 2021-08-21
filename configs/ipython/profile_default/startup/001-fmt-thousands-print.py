import IPython


def thousands(arg, p, cycle):
    p.text("{:,}".format(arg))

# General
frm = get_ipython().display_formatter.formatters['text/plain']
frm.for_type(int, thousands)
frm.for_type(float, thousands)


try:
    # numpy
    import numpy as np
    np.set_printoptions(formatter={
        'float_kind': lambda x: '{:,}'.format(x),
        'int_kind': lambda x: '{:,}'.format(x),
    })
except ImportError:
    pass


# pandas
try:
    import pandas as pd

    class IntFormatter(pd.core.format.GenericArrayFormatter):
        pd.set_option('display.float_format', lambda x: "{:,}".format(x))

        def _format_strings(self):
            formatter = self.formatter or (lambda x: ' {:,}'.format(x))
            fmt_values = [formatter(x) for x in self.values]
            return fmt_values

    pd.core.format.IntArrayFormatter = IntFormatter
except ImportError:
    pass
