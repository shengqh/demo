#!/usr/bin/perl
use strict;
use warnings;

use CQS::ClassFactory;
use CQS::FileUtils;
use Data::Dumper;
use Pipeline::scRNASeq;

my $def = {
  task_name => "AG3669",

  email      => "quanhu.sheng.1\@vumc.org",
  target_dir => create_directory_or_die("Z:/shengq1/scRNA_demo/3669/3669_V01"),

  #docker_command => "singularity exec /scratch/cqs/softwares/singularity/cqs-rnaseq.simg ",

  files => {
    "S1_Control" => ["Z:/shengq1/scRNA/alexander_gelbard/data/3669/Count/3669-AG-1/filtered_feature_bc_matrix.h5"],
    "S2_Control" => ["Z:/shengq1/scRNA/alexander_gelbard/data/3669/Count/3669-AG-2/filtered_feature_bc_matrix.h5"],
    "S3_Control" => ["Z:/shengq1/scRNA/alexander_gelbard/data/3669/Count/3669-AG-3/filtered_feature_bc_matrix.h5"],
    "S1_Treatment" => ["Z:/shengq1/scRNA/alexander_gelbard/data/3669/Count/3669-AG-4/filtered_feature_bc_matrix.h5"],
    "S2_Treatment" => ["Z:/shengq1/scRNA/alexander_gelbard/data/3669/Count/3669-AG-5/filtered_feature_bc_matrix.h5"],
    "S3_Treatment" => ["Z:/shengq1/scRNA/alexander_gelbard/data/3669/Count/3669-AG-6/filtered_feature_bc_matrix.h5"],
  },

  seurat_additional_rmd => "",
  webgestalt_organism   => "hsapiens",

  nFeature_cutoff_min => 200,
  nFeature_cutoff_max => 7500,
  nCount_cutoff       => 500,
  mt_cutoff           => 20,
  Mtpattern           => "^MT-|^Mt-|^mt-",
  rRNApattern         => "^Rp[sl][[:digit:]]|^RP[SL][[:digit:]]",
  Remove_Mt_rRNA      => "FALSE",
  resolution          => 0.8,
  species             => "Hs",

  markers_file => "Z:/shengq1/scRNA/PanglaoDB_markers_21_Oct_2019.tsv",
  details_rmd => "",
};

my $config = performScRNASeq( $def, 1 );

#performConfig($config);

1;
