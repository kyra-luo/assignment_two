#!/bin/bash

awk 'BEGIN {FS=OFS="\t"}
NR==1 {
  for (i=1; i<=NF; i++) {
    if ($i == "Continent") {
      col = i;
      break;
    }
  }
}
{
  for (i=1; i<=NF; i++) {
    if (i != col) {
      printf "%s%s", $i, (i == NF ? ORS : OFS)
    }
  }
}' life-satisfaction-vs-life-expectancy.tsv|head -n 6