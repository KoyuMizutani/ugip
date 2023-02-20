#!/bin/bash

i=1
# hoge.txtからURLを読み込む
while read -r url; do
  # URLからファイル名を抽出する
  filename=$(basename "$url")
  # ファイル名が画像の拡張子を持っているか確認する
  if [[ "$filename" =~ \.(jpg|jpeg|png|gif)$ ]]; then
    # 画像をダウンロードして番号を付けて保存する
    curl -o "images/image$i.${filename##*.}" "$url"
    i=$((i+1))
  fi
done < urls.txt
