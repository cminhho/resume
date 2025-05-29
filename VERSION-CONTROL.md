# Version Control Guide

This document outlines the versioning scheme and update process for the resume repository.

## Versioning Scheme

Files follow the naming convention: `resume-[type]-v[version].[extension]`

### Version Numbers

- **v0**: Archived/legacy versions that are kept for historical reference
- **v1**: Current production versions
- **v2+**: Newer versions under development or specialized variants

### File Types

- **minimal**: Clean, minimalist resume with essential information
- **achievements**: Visual representation of key achievements and metrics
- **linkedin**: Format optimized for LinkedIn content
- **formal**: Formal document-style resume (LaTeX)
- **markdown**: Markdown format for easy editing and conversion

## Update Workflow

When updating resume content:

1. **Create a new version** rather than overwriting existing ones
2. **Increment the version number** (e.g., v1 → v2)
3. **Update the main index.html** to point to the newest version
4. **Add older version to archive** if it's being fully replaced

## Archiving Process

1. Move outdated files to `formats/archive/`
2. Rename following the convention: `resume-[type]-v[old-version].[extension]`
3. Update any internal references in archived files
4. Update README.md to reflect the changes

## Branch Strategy

- **main/gh-pages**: Production-ready versions of resumes
- **develop**: Work in progress updates
- **feature/[name]**: For developing new resume formats or major changes

## Commit Message Format

Use descriptive commit messages following this format:

```
[type]: Brief description

Detailed explanation if needed
```

Where `[type]` is one of:
- **content**: Updates to resume content (experience, skills, etc.)
- **design**: Visual or layout changes
- **struct**: Repository structure changes
- **feat**: New resume format or feature
- **fix**: Bug fixes

## Example Workflow

```bash
# Create a new version of the minimal resume
cp formats/html/resume-minimal-v1.html formats/html/resume-minimal-v2.html

# Edit the new version
# ... make changes ...

# Update index.html to point to the new version
# ... update links ...

# Commit changes
git add .
git commit -m "content: Update work experience and skills in minimal resume"
git push
``` 