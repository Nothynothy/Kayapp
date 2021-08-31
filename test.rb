# ap "je sui sla"

# river = Topo.find(5).river

# ap StatsForRiver.call(river)





arr =       [{
                 :date => "2021-08-31T07:00:00Z",
                :level => 4356.0
            },
             {
                 :date => "2021-08-32T07:00:00Z",
                :level => 45.0
             }
            ]


ap arr.map {|set| [set[:date], set[:level]]}.to_h
