# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirWebApp.Repo.insert!(%ElixirWebApp.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias ElixirWebApp.Repo
alias ElixirWebApp.Article

Repo.insert! %Article{
  urlToImage: "https://tctechcrunch2011.files.wordpress.com/2017/05/messenger-inbox-feat.jpg?w=764&h=400&crop=1",
  url: "https://techcrunch.com/2017/05/18/facebook-messenger-debuts-a-new-look-focused-on-improving-navigation",
  title: "Facebook Messenger debuts a new look focused on improving navigation",
  # publishedAt: "2017-05-18T15:00:06Z",
  descrption: "Facebook Messenger is getting a new look. No, it's not getting rid of its Stories feature, Messenger Day, but is instead making a series a smaller changes to..",
  author: "Sarah Perez"
}
