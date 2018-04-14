#!/bin/bash

function template() {
  infile=${1}
  outfile=${2}
  tmpfile=${infile}.tmp
  echo "Templating ${infile} and saving as ${outfile}"
  sed "s/{{ .Env.\([a-zA-Z0-9_-]*\) }}/\${\1}/" < ${infile} > ${tmpfile}
  envsubst $VARS < ${tmpfile} > $outfile
  rm ${tmpfile}
  echo ""
  echo "----------------"
  cat $outfile
  echo "----------------"
  echo ""
}

if [ -f $1 ]; then
  infile=${1}
  template $infile $infile
fi

if [ -d $1 ]; then
  OUTDIR="$1/_config"
  INDIR="$1/config"
  mkdir -p ${OUTDIR}

  shopt -s nullglob
  for infile in $INDIR/*; do
    outfile=${OUTDIR}/`basename ${infile}`
    template ${infile} ${outfile}
  done

  rm -rf $INDIR
fi


