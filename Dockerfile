FROM texlive/texlive:latest-minimal

RUN apt-get update && \
    apt-get install -y fonts-font-awesome && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN tlmgr update --self --all && \
    tlmgr install \
    collection-xetex \
    roboto \
    enumitem \
    ragged2e \
    count1to \
    multitoc \
    prelim2e \
    fancyhdr \
    xifthen \
    ifmtarg \
    setspace \
    fontawesome \
    sourcesanspro \
    tcolorbox \
    pgf \
    environ \
    trimspaces \
    xstring \
    parskip \
    moresize \
    tikzfill \
    doi \
    etoolbox \
    lastpage \
    fontspec \
    unicode-math \
    amsmath \
    fontawesome5 \
    xkeyval \
    kvoptions \
    ltxcmds \
    kvsetkeys \
    hyperref \
    bookmark \
    xcolor \
    geometry && \
    tlmgr path add

WORKDIR /doc

CMD ["xelatex", "cv.tex"]
