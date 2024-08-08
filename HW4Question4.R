# I changed the date but anytime I went above 2020 I got an error that the breaks and labels were broken
# so i just went down a year
# I also changed the colors to the ones from question 3 
# 7c6bea
# fe8d6d
# 8fe388



load("/Users/joshuakimbrell/Documents/UM/Summer 24/p2/data/r/Rscripts/DATA/preprint_growth.rda") #please change the path if needed
head(preprint_growth)
preprint_growth %>% filter(archive == "bioRxiv") %>%
  filter(count > 0) -> biorxiv_growth
preprints<-preprint_growth %>% filter(archive %in%
                                        c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")) %>%filter(count > 0) %>%
  mutate(archive = factor(archive, levels = c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")))
preprints_final <- filter(preprints, date == ymd("2016-01-01"))
ggplot(preprints) +
  aes(date, count, color = archive, fill = archive) +
  geom_line(size = 1) +
  scale_y_continuous(
    limits = c(0, 600), expand = c(0, 0),
    name = "preprints / month",
    sec.axis = dup_axis( #this part is for the second y axis
      breaks = preprints_final$count, #and we use the counts to position our labels
      labels = c("arXivq-bio", "PeerJPreprints", "bioRxiv"),
      name = NULL)
  )+
  scale_x_date(name = "year",
               limits = c(min(biorxiv_growth$date), ymd("2016-01-01"))) +
  scale_color_manual(values = c("#7c6bea", "#fe8d6d", "#8fe388"),
                     name = NULL) +
  theme(legend.position = "none")