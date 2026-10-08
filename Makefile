prepare:
	mkdir -p malicious_dir

run:
	./antivirus.sh test_dir malicious_dir 5

restore:
	./restore.sh

clean:
	rm -f directory-info.last directory-info.new
