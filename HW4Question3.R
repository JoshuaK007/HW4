#Used ChatGPT to search how to add title to ggplot and add the theme

cars93 <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = FALSE, method = "loess", formula = y ~ x, color = "#0072B2") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  )+
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")

ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "lm", formula = y ~ x, color = "#8fe388") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  )+
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)") +
  ggtitle("lm method") +
  theme(
    plot.title = element_text(size = 14, color = "#8fe388")
  )


ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "glm", formula = y ~ x, color = "#fe8d6d") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  )+
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)") +
  ggtitle("glm method") +
  theme(
    plot.title = element_text(size = 14, color = "#fe8d6d")
  )


ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "gam", formula = y ~ x, color = "#7c6bea") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  )+
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)") +
  ggtitle("gam method") +
  theme(
    plot.title = element_text(size = 14, color = "#7c6bea")
  )


