library(ggplot2)
teams <- read.csv('teams.csv')
teams$teamID = NULL # messes with data
teams$franchID = NULL # messes with the data as wel
runs <- lm(R ~., data=teams)
runs2 <- update(runs, .~. -DivWinY)

# increases adj r sq
runs3 <- update(runs, .~. -RA)

# stick with runs2

png('Plots%02d.png', width=6, height=6, units='in', res=300)
plot(resid(runs2))
qqnorm(resid(runs2))
ggplot(runs2, aes(R, HR)) + geom_point() + stat_smooth()
dev.off()
