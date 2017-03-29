const fs = require('fs');
const glob = require('glob');
const chalk = require('chalk');
const yaml = require('js-yaml');

function noop() {
}

function validate(filePatterns) {
    return filePatterns.reduce((reports, filePattern = []) => {
        const files = glob.sync(filePattern, {absolute: true});

        files.forEach(file => {
            try {
                yaml.safeLoadAll(fs.readFileSync(file), noop);
            } catch (e) {
                reports.push({file, error: e});
            }
        });

        return reports;
    }, []);
}

function printReport({file, error}) {
    console.error(chalk.underline(file));
    console.error(`  ${error.mark.line}:${error.mark.column}  ${chalk.red('error')}  ${error.message}`);
}

function printSummary(reports) {
    console.error(chalk.red(`  ${reports.length} error(s)`));
}

const filePatterns = process.argv.slice(2).filter(arg => arg !== '--');
const reports = validate(filePatterns);

if (reports.length) {
    reports.forEach(printReport);
    printSummary(reports);
    process.exit(1);
}
