login VM oracle:oracle

modifier /etc/hosts (ligne tt en bas) pour mettre l''ip du eth0
save

login db : oracle:oracle

then

alter user hr identified by hr account unlock;

then

login db hr:hr