library('reshape2')
library('ggplot2')
melted = melt(a1, id.vars = 'time')
ggplot(data=melted, aes(x=time, y=value, group=variable), colour=variable) + geom_line()
