#!/usr/bin/env bash

grep -Fq '/usr/local/bin/bash' /etc/shells \
    || echo '/usr/local/bin/bash' >> /etc/shells
grep -Fq '/usr/local/bin/fish' /etc/shells \
    || echo '/usr/local/bin/fish' >> /etc/shells
grep -Fq '/usr/local/bin/zsh' /etc/shells \
    || echo '/usr/local/bin/zsh' >> /etc/shells
