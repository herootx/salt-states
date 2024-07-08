mono-repo:
  pkgrepo.managed:
    - humanname: Mono
    - name: deb [arch=amd64] https://download.mono-project.com/repo/ubuntu stable-focal main
    - file: /etc/apt/sources.list.d/mono-official-stable.list
    - dist: stable-jammy
    - key_url: https://download.mono-project.com/repo/xamarin.gpg
    - refresh: True
    - clean_file: True
