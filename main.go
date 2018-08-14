package main

import (
	"github.com/shogo82148/go-mecab"
	)

func main() {
	tagger, err := mecab.New(map[string]string{"output-format-type": "wakati"})
	if err != nil {
		panic(err)
	}
	defer tagger.Destroy()
	node, err := tagger.ParseToNode("こんにちは世界")
	if err != nil {
		panic(err)
	}
	for ; node != (mecab.Node{}); node = node.Next() {
		if node.Surface()!="" {
			println(node.Surface())
		}
	}
}
