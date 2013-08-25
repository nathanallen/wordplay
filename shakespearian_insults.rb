#Insulting word-lists
list0 = ["yeasty", "weedy", "wayward", "warped", "villainous", "venomed", "vain", "unmuzzled", "tottering", "surly", "spongy", "spleeny", "saucy", "ruttish", "roguish", "reeky", "rank", "qualling", "puny", "puking", "pribbling", "paunchy", "mewling", "mangled", "mammering", "lumpish", "loggerheaded", "jarring", "infectious", "impertinent", "gorbellied", "goatish", "gleeking", "frothy", "froward", "fobbing", "fawning", "errant", "droning", "dissembling", "dankish", "currish", "craven", "clouted", "cockered", "churlish", "bootless", "beslubbering", "bawdy", "artless"]
list1 = ["weather-bitten", "unchin-snouted", "toad-spotted", "tickle-brained", "tardy-gaited", "swag-bellied", "spur-galled", "sheep-biting", "shard-borne", "rump-fed", "rude-growing", "rough-hewn", "reeling-ripe", "pox-marked", "pottle-deep", "plume-plucked", "onion-eyed", "motley-minded", "milk-livered", "knotty-pated", "ill-nurtured", "ill-breeding", "idle-headed", "hell-hated", "hedge-born", "hasty-witted", "half-faced", "guts-griping", "full-gorged", "fool-born", "folly-fallen", "fly-bitten", "flap-mouthed", "fen-sucked", "fat-kidneyed", "elf-skinned", "earth-vexing", "dread-bolted", "doghearted", "dizzy-eyed", "dismal-dreaming", "crook-pated", "common-kissing", "clay-brained", "clapper-clawed", "boil-brained", "beetle-headed", "beef-witted", "bat-fowling", "base-court"]
list2 = ["wagtail", "whey-face", "vassal", "varlet", "strumpet", "skainsmate", "scut", "ratsbane", "pumpion", "puttock", "pignut", "pigeon-egg", "nut-hook", "mumble-news", "moldwarp", "miscreant", "minnow", "measle", "mammet", "malt-worm", "maggot-pie", "lout", "lewdster", "joithead", "hugger-mugger", "horn-beast", "hedge-pig", "harpy", "haggard", "gudgeon", "giglet", "fustilarian", "foot-licker", "flirt-gill", "flax-wench", "flap-dragon", "dewberry", "death-token", "codpiece", "coxcomb", "clotpole", "clack-dish", "canker-blossom", "bum-bailey", "bugbear", "boar-pig", "bladder", "barnacle", "baggage", "apple-john"]

#generates random insult-indices
r = rand(3)
r0 = rand(list0.length)
r1 = rand(list1.length)
r2 = rand(list2.length)

#prints insulting output
if r == 0; p "Thou #{list0[r0]} #{list1[r1]} #{list2[r2]}!"
elsif r == 1; p "Why you! You #{list0[r0]} #{list1[r1]} #{list2[r2]}!"
elsif r == 2; p "#{list0[r0].capitalize} #{list1[r1]} #{list2[r2]}!"
end
