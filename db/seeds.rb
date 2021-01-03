# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ label: 'Star Wars' }, { label: 'Lord of the Rings' }])
#   Character.create(label: 'Luke', movie: movies.first)
Example.destroy_all
Grammar.destroy_all
Dialect.destroy_all
[
  {
    name_jp: "広島弁",
    name_en: "Hiroshima",
    grammars: [
      {label: "いる / おる ・ おるん?", 
        description: "いる changes to おる \n おるん? for questions",
        examples: [
        {language: "jp", sentence1: "いまどこにおるん?", sentence2: "ひろしまえきにおる"},
        {language: "en", sentence1: "Where are you now?", sentence2: "I'm at Hiroshima Station."}
      ]},
      {label: "よ / なんよ", 
        description: "よ changes to なんよ",
        examples: [
        {language: "jp", sentence1: "くるま、かったんだって?", sentence2: "そおなんよ!"},
        {language: "en", sentence1: "Did he say that he bought the car?", sentence2: "Yeah."}
      ]},
      {label: "ない / ん", 
        description: "ない changes to ん",
        examples: [
        {language: "jp", sentence1: "今日なにする？", sentence2: "そうじせんといけん"},
        {language: "en", sentence1: "What are you doing today?", sentence2: "I have to clean."}
      ]},
      {label: "しないで / しんさんな、せんといて", 
        description: "しないで changes to しんさんな \n せんといて for emphasis",
        examples: [
        {language: "jp", sentence1: "眠い", sentence2: "よふかししんさんな"},
        {language: "en", sentence1: "I'm sleepy.", sentence2: "Don't stay up so late."}
      ]},
      {label: "だ / じゃ", 
        description: "だ changes to じゃ",
        examples: [
        {language: "jp", sentence1: "明日雨だって", sentence2: "そうなんじゃ？"},
        {language: "en", sentence1: "It's going to rain tomorrow.", sentence2: "Is that so?"}
      ]},
      {label: "だろう / じゃろう", 
        description: "だろう changes to じゃろう",
        examples: [
        {language: "jp", sentence1: "天気はどう？", sentence2: "雨じゃろう？"},
        {language: "en", sentence1: "How is the weather?", sentence2: "It's probably raining."}
      ]},
      {label: "ねえ / のぉ", 
        description: "ねえ changes to のぉ",
        examples: [
        {language: "jp", sentence1: "美味しかったのぉ！", sentence2: "ほうじゃのぉ"},
        {language: "en", sentence1: "That was tasty!", sentence2: "It sure was!"}
      ]},
      {label: "いい / ええ", 
        description: "いい changes to ええ",
        examples: [
        {language: "jp", sentence1: "これ食べてええ？", sentence2: "ええよ"},
        {language: "en", sentence1: "That was tasty!", sentence2: "It sure was!"}
      ]},
      {label: "れば / りゃあ", 
        description: "れば changes to りゃあ",
        examples: [
        {language: "jp", sentence1: "お腹すいた", sentence2: "食べりゃあええじゃん？"},
        {language: "en", sentence1: "I'm hungry.", sentence2: "You should eat."}
      ]},
      {label: "から / けえ", 
        description: "よ changes to なんよ",
        examples: [
        {language: "jp", sentence1: "後でいくけえ待っといて", sentence2: "はい、わかった"},
        {language: "en", sentence1: "I'll go later, so wait for me.", sentence2: "Alright sounds good."}
      ]},
      {label: "だから / じゃけ ・ じゃけん", 
        description: "だから changes to じゃけ",
        examples: [
        {language: "jp", sentence1: "今日雨じゃけん運転気をつけてね", sentence2: "はい、わかった"},
        {language: "en", sentence1: "It's raining today, so be careful driving", sentence2: "Ok I will."}
      ]},
      {label: "とても / ぶち ・ ばり", 
        description: "とても changes to ぶち or ばり",
        examples: [
        {language: "jp", sentence1: "今日ぶち寒いのぉ", sentence2: "ほうじゃのぉ、ばりさぶい。"},
        {language: "en", sentence1: "It's so cold today!", sentence2: "It sure is! So cold!"}
      ]},
    ]
  },
  {
    name_jp: "大阪弁",
    name_en: "Osaka",
    grammars: [
      {label: "ね / な", 
        description: "ね changes to な at end of sentence",
        examples: [
        {language: "jp", sentence1: "暑いな！", sentence2: "そうだな！"},
        {language: "en", sentence1: "It's hot!", sentence2: "Yeah, it is!"}
      ]},
      {label: "よ / で ・ わ", 
        description: "よ changes to で at end of sentence \n or わ for softer meaning",
        examples: [
        {language: "jp", sentence1: "ケーキどうだった？", sentence2: "美味しかったで"},
        {language: "en", sentence1: "How was the cake?", sentence2: "It was good."}
      ]},
      {label: "だよね ・ でしょ / やん",
        description: "だよね or でしょ changes to やん",
        examples: [
        {language: "jp", sentence1: "彼クビになった！", sentence2: "うそやん！"},
        {language: "en", sentence1: "He was fired!", sentence2: "No way!"}
      ]},
    ]
    },
    {
    name_jp: "京都弁",
    name_en: "Kyoto",
    grammars: [
      {label: "ありません / おへん", 
        description: "ありません changes to おへん",
        examples: [
        {language: "jp", sentence1: "地図はありますか？", sentence2: "地図はおへん。"},
        {language: "en", sentence1: "Is there a map?", sentence2: "No there isn't"}
      ]},
      {label: "でしょうか / まっしゃりょか", 
        description: "でしょうか changes to まっしゃりょか",
        examples: [
        {language: "jp", sentence1: "その店わかりまっしゃりょか？", sentence2: "はい、わかります。"},
        {language: "en", sentence1: "I suppose you know that store?", sentence2: "Yes I know it."}
      ]},
      {
        label: "かったです / おした", 
        description: "かったです changes to おした after adjective",
        examples: [
        {language: "jp", sentence1: "昨日あつおしたね。", sentence2: "そうですね。"},
        {language: "en", sentence1: "Yesterday was hot, wasn't it?", sentence2: "Yes it was."}
      ]},
    ]
    }
  ].each do |dialect| 
    d = Dialect.create(
      name_jp: dialect[:name_jp], 
      name_en: dialect[:name_en]
    )
    dialect[:grammars].each_with_index do |grammar, index|
      g = Grammar.create(
        label: grammar[:label], 
        description: grammar[:description], 
        position: index, 
        dialect: d
      )
      grammar[:examples].each do |example|
        Example.create(
          language: example[:language], 
          sentence1: example[:sentence1], 
          sentence2: example[:sentence2], 
          grammar: g
        )
      end
    end
  end
