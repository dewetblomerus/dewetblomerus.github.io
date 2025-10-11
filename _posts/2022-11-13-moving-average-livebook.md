---
layout: post
title: Displaying a Moving Average with Livebook
tags: [Elixir]
---

You will need [Livebook](https://livebook.dev/){:target="_blank"} installed. And then you can click the following link to see how to create a moving average graph in Livebook

[![Run in Livebook](https://livebook.dev/badge/v1/blue.svg)](https://livebook.dev/run?url=https%3A%2F%2Fdewetblomerus.com%2Fassets%2Flivebooks%2Fmoving-average.livemd){:target="_blank"}

Here is the main part of the work:

```elixir
df =
  Explorer.Datasets.fossil_fuels()
  |> DataFrame.filter_with(&Series.equal(&1["country"], "DEMOCRATIC PEOPLE S REPUBLIC OF KOREA"))
  |> DataFrame.mutate_with(fn data ->
    moving_average =
      data[:total]
      |> Series.window_mean(3)

    %{moving_average: moving_average}
  end)
```

South Korea was the first country I found with a significant decrease in total fossil fuel production, which displays the moving average nicely.

And here is the final graph
![image tooltip here](/assets/images/moving-average-livebook.webp)
