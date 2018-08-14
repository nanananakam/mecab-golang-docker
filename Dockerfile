FROM golang
ENV CGO_LDFLAGS "-L/path/to/lib -lmecab -lstdc++"
ENV CGO_CFLAGS "-I/path/to/include"
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
RUN apt-get update && apt-get -y upgrade \
 && apt-get -y install mecab libmecab-dev mecab-ipadic-utf8 \
 && go get -u github.com/golang/dep/...
ADD . /go/src/mecab
RUN cd /go/src/mecab && dep ensure && go build -o /exe main.go
CMD ["/exe"]