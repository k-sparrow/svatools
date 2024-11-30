# -------------------------------------
# Copyright (c) 2024, Dror Kabely
# -------------------------------------
#

load("@aspect_rules_lint//lint:flake8.bzl", "lint_flake8_aspect")
load("@aspect_rules_lint//lint:ruff.bzl", "lint_ruff_aspect")
load("@aspect_rules_lint//lint:lint_test.bzl", "lint_test")


flake8 = lint_flake8_aspect(
    binary = "@@//tools/lint:flake8",
    config = "@@//assets/lint:.flake8",
)

lake8_test = lint_test(aspect = flake8)

ruff = lint_ruff_aspect(
    binary = "@multitool//tools/ruff",
    configs = [
        "@@//assets/lint:.ruff.toml",
    ],
)

ruff_test = lint_test(aspect = ruff)