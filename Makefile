prepare:
	mkdir -p malicious_dir

run: prepare
	./antivirusd.sh test_dir malicious_dir 5

restore: prepare
	./restore.sh test_dir malicious_dir

clean:
	rm -f directory-info.last directory-info.new
