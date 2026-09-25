params.outdir = 's3://sabri-eu-west2-test/lineage-11272'

process writeResult {
    container 'ubuntu:22.04'
    publishDir params.outdir, mode: 'copy'

    output:
    path 'result.txt'

    script:
    """
    echo "written by ${workflow.runName}" > result.txt
    """
}

workflow {
    writeResult()
}
