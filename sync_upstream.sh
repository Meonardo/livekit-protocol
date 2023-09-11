# switch to main
git checkout main

# sync upstream
git fetch upstream

git merge upstream/main
git pull --ff-only upstream main

# push to origin
git push origin main

# switch back to meonardo
git checkout meonardo

# merge upstream changes
git merge main

# sync proto files
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

# only need to sync `livekit_modesl.proto` changes
protoc -I=$SRC_DIR --go_out=$DST_DIR $SRC_DIR/livekit_modesl.proto

# save the changes
git add ./livekit/livekit_models.pb.go

git commit -m "auto sync changes"

# push to origin
git push origin meonardo