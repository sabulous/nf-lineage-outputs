process writeResult {
    container 'ubuntu:22.04'

    output:
    path 'result.txt'

    script:
    """
    echo "written by ${workflow.runName}" > result.txt
    """
}

workflow {
    main:
    ch_result = writeResult()

    publish:
    result = ch_result
}

output {
    result {
        path '.'
    }
}
