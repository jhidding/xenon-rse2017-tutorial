.. code-tab:: bash

    #!/usr/bin/env bash

    # step 1: upload input file(s)
    xenon filesystem sftp --location localhost:10022 --username xenon --password javagat \
    upload --replace /home/tutorial/xenon/sleep.sh /home/xenon/sleep.sh

    # step 2: submit job and capture its job identifier
    JOBID=$(xenon scheduler slurm --location localhost:10022 --username xenon --password javagat \
    submit --stdout sleep.stdout.txt bash sleep.sh 60)

    # add blocking wait
    xenon scheduler slurm --location localhost:10022 --username xenon --password javagat \
    wait $JOBID

    # step 3: download generated output file(s)
    xenon filesystem sftp --location localhost:10022 --username xenon --password javagat \
    download --replace /home/xenon/sleep.stdout.txt /home/tutorial/xenon/sleep.stdout.txt