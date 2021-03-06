func! VlsCmd(server_info)
  let a:server_info.initialization_options = g:initializationOptions
  return ['vls']
endfunc

augroup config#vue
  autocmd!
  autocmd BufWritePost *.vue syntax sync fromstart
  autocmd BufReadPost *.vue syntax sync fromstart
  autocmd FileType vue syntax sync fromstart
  autocmd BufEnter *.vue set filetype=vue

  if executable('vls')
    autocmd User lsp_setup lspex#add_server('vue', [vls])
  endif
augroup END
let g:vue_disable_pre_processors = 1

python3 << EOF
import json
import os
import vim

config = r"""{
    "initializationOptions": {
        "config": {
            "editor": {
                "fontFamily": "'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'",
                "fontWeight": "normal",
                "fontSize": 14,
                "lineHeight": 0,
                "letterSpacing": 0,
                "lineNumbers": "on",
                "rulers": [],
                "wordSeparators": "`~!@#$%^&*()-=+[{]}\\|;:'\",.<>/?",
                "tabSize": 4,
                "insertSpaces": true,
                "detectIndentation": true,
                "roundedSelection": true,
                "scrollBeyondLastLine": true,
                "scrollBeyondLastColumn": 5,
                "smoothScrolling": false,
                "minimap": {
                    "enabled": true,
                    "side": "right",
                    "showSlider": "mouseover",
                    "renderCharacters": true,
                    "maxColumn": 120
                },
                "hover": {
                    "enabled": true,
                    "delay": 300,
                    "sticky": true
                },
                "find": {
                    "seedSearchStringFromSelection": true,
                    "autoFindInSelection": false
                },
                "wordWrap": "off",
                "wordWrapColumn": 80,
                "wrappingIndent": "same",
                "mouseWheelScrollSensitivity": 1,
                "multiCursorModifier": "alt",
                "multiCursorMergeOverlapping": true,
                "quickSuggestions": {
                    "other": true,
                    "comments": false,
                    "strings": false
                },
                "quickSuggestionsDelay": 10,
                "parameterHints": true,
                "autoClosingBrackets": true,
                "formatOnType": false,
                "formatOnPaste": false,
                "autoIndent": true,
                "suggestOnTriggerCharacters": true,
                "acceptSuggestionOnEnter": "on",
                "acceptSuggestionOnCommitCharacter": true,
                "snippetSuggestions": "inline",
                "emptySelectionClipboard": true,
                "wordBasedSuggestions": true,
                "suggestSelection": "recentlyUsed",
                "suggestFontSize": 0,
                "suggestLineHeight": 0,
                "selectionHighlight": true,
                "occurrencesHighlight": true,
                "overviewRulerLanes": 3,
                "overviewRulerBorder": true,
                "cursorBlinking": "blink",
                "mouseWheelZoom": false,
                "cursorStyle": "line",
                "cursorWidth": 0,
                "fontLigatures": false,
                "hideCursorInOverviewRuler": false,
                "renderWhitespace": "none",
                "renderControlCharacters": false,
                "renderIndentGuides": true,
                "highlightActiveIndentGuide": true,
                "renderLineHighlight": "line",
                "codeLens": true,
                "folding": true,
                "foldingStrategy": "auto",
                "showFoldingControls": "mouseover",
                "matchBrackets": true,
                "glyphMargin": true,
                "useTabStops": true,
                "trimAutoWhitespace": true,
                "stablePeek": false,
                "dragAndDrop": true,
                "accessibilitySupport": "auto",
                "showUnused": true,
                "links": true,
                "colorDecorators": true,
                "lightbulb": {
                    "enabled": true
                },
                "codeActionsOnSave": {},
                "codeActionsOnSaveTimeout": 750,
                "selectionClipboard": true,
                "largeFileOptimizations": true,
                "tabCompletion": false,
                "tokenColorCustomizations": {},
                "formatOnSave": false,
                "formatOnSaveTimeout": 750
            },
            "diffEditor": {
                "renderSideBySide": true,
                "ignoreTrimWhitespace": true,
                "renderIndicators": true
            },
            "http": {
                "proxy": "",
                "proxyStrictSSL": true,
                "proxyAuthorization": null
            },
            "telemetry": {
                "enableTelemetry": true,
                "enableCrashReporter": true
            },
            "workbench": {
                "list": {
                    "multiSelectModifier": "ctrlCmd",
                    "openMode": "singleClick"
                },
                "tree": {
                    "horizontalScrolling": false
                },
                "statusBar": {
                    "feedback": {
                        "visible": true
                    },
                    "visible": true
                },
                "startupEditor": "welcomePage",
                "colorTheme": "Default Dark+",
                "iconTheme": "vs-seti",
                "colorCustomizations": {},
                "editor": {
                    "showTabs": true,
                    "labelFormat": "default",
                    "tabCloseButton": "right",
                    "tabSizing": "fit",
                    "showIcons": true,
                    "enablePreview": true,
                    "enablePreviewFromQuickOpen": true,
                    "closeOnFileDelete": true,
                    "openPositioning": "right",
                    "openSideBySideDirection": "right",
                    "closeEmptyGroups": true,
                    "revealIfOpen": false
                },
                "commandPalette": {
                    "history": 50,
                    "preserveInput": false
                },
                "quickOpen": {
                    "closeOnFocusLost": true
                },
                "settings": {
                    "openDefaultSettings": true,
                    "enableNaturalLanguageSearch": true,
                    "settingsSearchTocBehavior": "hide",
                    "tocVisible": true
                },
                "sideBar": {
                    "location": "left"
                },
                "panel": {
                    "defaultLocation": "bottom"
                },
                "activityBar": {
                    "visible": true
                },
                "view": {
                    "alwaysShowHeaderActions": false
                },
                "tips": {
                    "enabled": true
                }
            },
            "problems": {
                "decorations": {
                    "enabled": true
                },
                "autoReveal": true
            },
            "keyboard": {
                "dispatch": "code"
            },
            "debug": {
                "allowBreakpointsEverywhere": false,
                "openExplorerOnEnd": false,
                "inlineValues": false,
                "toolBarLocation": "floating",
                "showInStatusBar": "onFirstSessionStart",
                "internalConsoleOptions": "openOnFirstSessionStart",
                "openDebug": "openOnFirstSessionStart",
                "enableAllHovers": false
            },
            "launch": {
                "configurations": [],
                "compounds": []
            },
            "outline": {
                "icons": true,
                "problems": {
                    "enabled": true,
                    "colors": true,
                    "badges": true
                }
            },
            "scm": {
                "alwaysShowProviders": false,
                "diffDecorations": "all",
                "diffDecorationsGutterWidth": 3
            },
            "window": {
                "openFilesInNewWindow": "off",
                "openFoldersInNewWindow": "default",
                "openWithoutArgumentsInNewWindow": "on",
                "restoreWindows": "one",
                "restoreFullscreen": false,
                "zoomLevel": 0,
                "title": "${dirty}${activeEditorShort}${separator}${rootName}${separator}${appName}",
                "newWindowDimensions": "default",
                "closeWhenEmpty": false,
                "menuBarVisibility": "default",
                "enableMenuBarMnemonics": true,
                "titleBarStyle": "native"
            },
            "zenMode": {
                "fullScreen": true,
                "centerLayout": true,
                "hideTabs": true,
                "hideStatusBar": true,
                "hideActivityBar": true,
                "restore": false
            },
            "files": {
                "exclude": {
                    "**/.git": true,
                    "**/.svn": true,
                    "**/.hg": true,
                    "**/CVS": true,
                    "**/.DS_Store": true
                },
                "associations": {},
                "encoding": "utf8",
                "autoGuessEncoding": false,
                "eol": "\n",
                "trimTrailingWhitespace": false,
                "insertFinalNewline": false,
                "trimFinalNewlines": false,
                "autoSave": "off",
                "autoSaveDelay": 1000,
                "watcherExclude": {
                    "**/.git/objects/**": true,
                    "**/.git/subtree-cache/**": true,
                    "**/node_modules/**": true
                },
                "hotExit": "onExit",
                "useExperimentalFileWatcher": false,
                "defaultLanguage": "",
                "maxMemoryForLargeFilesMB": 4096
            },
            "explorer": {
                "openEditors": {
                    "visible": 9
                },
                "autoReveal": true,
                "enableDragAndDrop": true,
                "confirmDragAndDrop": true,
                "confirmDelete": true,
                "sortOrder": "default",
                "decorations": {
                    "colors": true,
                    "badges": true
                }
            },
            "search": {
                "exclude": {
                    "**/node_modules": true,
                    "**/bower_components": true
                },
                "useRipgrep": true,
                "useIgnoreFiles": true,
                "quickOpen": {
                    "includeSymbols": false
                },
                "followSymlinks": true,
                "smartCase": false,
                "location": "sidebar"
            },
            "terminal": {
                "integrated": {
                    "shell": {
                        "linux": "/bin/bash",
                        "osx": "/bin/bash",
                        "windows": "cmd.exe"
                    },
                    "shellArgs": {
                        "linux": [],
                        "osx": [
                            "-l"
                        ],
                        "windows": []
                    },
                    "macOptionIsMeta": false,
                    "copyOnSelection": false,
                    "drawBoldTextInBrightColors": true,
                    "fontFamily": "",
                    "fontSize": 14,
                    "letterSpacing": 0,
                    "lineHeight": 1,
                    "fontWeight": "normal",
                    "fontWeightBold": "bold",
                    "cursorBlinking": false,
                    "cursorStyle": "block",
                    "scrollback": 1000,
                    "setLocaleVariables": false,
                    "rendererType": "auto",
                    "rightClickBehavior": "default",
                    "cwd": "",
                    "confirmOnExit": false,
                    "enableBell": false,
                    "commandsToSkipShell": [
                        "editor.action.toggleTabFocusMode",
                        "workbench.action.debug.continue",
                        "workbench.action.debug.pause",
                        "workbench.action.debug.restart",
                        "workbench.action.debug.run",
                        "workbench.action.debug.start",
                        "workbench.action.debug.stepInto",
                        "workbench.action.debug.stepOut",
                        "workbench.action.debug.stepOver",
                        "workbench.action.debug.stop",
                        "workbench.action.firstEditorInGroup",
                        "workbench.action.focusActiveEditorGroup",
                        "workbench.action.focusEighthEditorGroup",
                        "workbench.action.focusFifthEditorGroup",
                        "workbench.action.focusFirstEditorGroup",
                        "workbench.action.focusFourthEditorGroup",
                        "workbench.action.focusLastEditorGroup",
                        "workbench.action.focusSecondEditorGroup",
                        "workbench.action.focusSeventhEditorGroup",
                        "workbench.action.focusSixthEditorGroup",
                        "workbench.action.focusThirdEditorGroup",
                        "workbench.action.lastEditorInGroup",
                        "workbench.action.navigateDown",
                        "workbench.action.navigateLeft",
                        "workbench.action.navigateRight",
                        "workbench.action.navigateUp",
                        "workbench.action.openNextRecentlyUsedEditorInGroup",
                        "workbench.action.openPreviousRecentlyUsedEditorInGroup",
                        "workbench.action.quickOpen",
                        "workbench.action.quickOpenPreviousEditor",
                        "workbench.action.quickOpenView",
                        "workbench.action.showCommands",
                        "workbench.action.tasks.build",
                        "workbench.action.tasks.restartTask",
                        "workbench.action.tasks.runTask",
                        "workbench.action.tasks.showLog",
                        "workbench.action.tasks.showTasks",
                        "workbench.action.tasks.terminate",
                        "workbench.action.tasks.test",
                        "workbench.action.terminal.clear",
                        "workbench.action.terminal.clearSelection",
                        "workbench.action.terminal.copySelection",
                        "workbench.action.terminal.deleteWordLeft",
                        "workbench.action.terminal.deleteWordRight",
                        "workbench.action.terminal.focus",
                        "workbench.action.terminal.focusAtIndex1",
                        "workbench.action.terminal.focusAtIndex2",
                        "workbench.action.terminal.focusAtIndex3",
                        "workbench.action.terminal.focusAtIndex4",
                        "workbench.action.terminal.focusAtIndex5",
                        "workbench.action.terminal.focusAtIndex6",
                        "workbench.action.terminal.focusAtIndex7",
                        "workbench.action.terminal.focusAtIndex8",
                        "workbench.action.terminal.focusAtIndex9",
                        "workbench.action.terminal.focusFindWidget",
                        "workbench.action.terminal.focusNext",
                        "workbench.action.terminal.focusNextPane",
                        "workbench.action.terminal.focusPrevious",
                        "workbench.action.terminal.focusPreviousPane",
                        "workbench.action.terminal.hideFindWidget",
                        "workbench.action.terminal.kill",
                        "workbench.action.terminal.moveToLineEnd",
                        "workbench.action.terminal.moveToLineStart",
                        "workbench.action.terminal.new",
                        "workbench.action.terminal.newInActiveWorkspace",
                        "workbench.action.terminal.paste",
                        "workbench.action.terminal.resizePaneDown",
                        "workbench.action.terminal.resizePaneLeft",
                        "workbench.action.terminal.resizePaneRight",
                        "workbench.action.terminal.resizePaneUp",
                        "workbench.action.terminal.runActiveFile",
                        "workbench.action.terminal.runSelectedText",
                        "workbench.action.terminal.scrollDown",
                        "workbench.action.terminal.scrollDownPage",
                        "workbench.action.terminal.scrollToBottom",
                        "workbench.action.terminal.scrollToNextCommand",
                        "workbench.action.terminal.scrollToPreviousCommand",
                        "workbench.action.terminal.scrollToTop",
                        "workbench.action.terminal.scrollUp",
                        "workbench.action.terminal.scrollUpPage",
                        "workbench.action.terminal.selectAll",
                        "workbench.action.terminal.selectToNextCommand",
                        "workbench.action.terminal.selectToNextLine",
                        "workbench.action.terminal.selectToPreviousCommand",
                        "workbench.action.terminal.selectToPreviousLine",
                        "workbench.action.terminal.split",
                        "workbench.action.terminal.splitInActiveWorkspace",
                        "workbench.action.terminal.toggleTerminal",
                        "workbench.action.togglePanel"
                    ],
                    "env": {
                        "osx": {},
                        "linux": {},
                        "windows": {}
                    },
                    "showExitAlert": true,
                    "experimentalRestore": false,
                    "experimentalTextureCachingStrategy": "static"
                },
                "explorerKind": "integrated",
                "external": {
                    "windowsExec": "C:\\Windows\\System32\\cmd.exe",
                    "osxExec": "Terminal.app",
                    "linuxExec": "x-terminal-emulator"
                }
            },
            "extensions": {
                "autoUpdate": true,
                "ignoreRecommendations": false,
                "showRecommendationsOnlyOnDemand": false,
                "closeExtensionDetailsOnViewChange": false
            },
            "css": {
                "validate": true,
                "colorDecorators": {
                    "enable": true
                },
                "lint": {
                    "compatibleVendorPrefixes": "ignore",
                    "vendorPrefix": "warning",
                    "duplicateProperties": "ignore",
                    "emptyRules": "warning",
                    "importStatement": "ignore",
                    "boxModel": "ignore",
                    "universalSelector": "ignore",
                    "zeroUnits": "ignore",
                    "fontFaceProperties": "warning",
                    "hexColorLength": "error",
                    "argumentsInColorFunction": "error",
                    "unknownProperties": "warning",
                    "ieHack": "ignore",
                    "unknownVendorSpecificProperties": "ignore",
                    "propertyIgnoredDueToDisplay": "warning",
                    "important": "ignore",
                    "float": "ignore",
                    "idSelector": "ignore",
                    "unknownAtRules": "warning"
                },
                "trace": {
                    "server": "off"
                }
            },
            "scss": {
                "validate": true,
                "colorDecorators": {
                    "enable": true
                },
                "lint": {
                    "compatibleVendorPrefixes": "ignore",
                    "vendorPrefix": "warning",
                    "duplicateProperties": "ignore",
                    "emptyRules": "warning",
                    "importStatement": "ignore",
                    "boxModel": "ignore",
                    "universalSelector": "ignore",
                    "zeroUnits": "ignore",
                    "fontFaceProperties": "warning",
                    "hexColorLength": "error",
                    "argumentsInColorFunction": "error",
                    "unknownProperties": "warning",
                    "ieHack": "ignore",
                    "unknownVendorSpecificProperties": "ignore",
                    "propertyIgnoredDueToDisplay": "warning",
                    "important": "ignore",
                    "float": "ignore",
                    "idSelector": "ignore"
                }
            },
            "less": {
                "validate": true,
                "colorDecorators": {
                    "enable": true
                },
                "lint": {
                    "compatibleVendorPrefixes": "ignore",
                    "vendorPrefix": "warning",
                    "duplicateProperties": "ignore",
                    "emptyRules": "warning",
                    "importStatement": "ignore",
                    "boxModel": "ignore",
                    "universalSelector": "ignore",
                    "zeroUnits": "ignore",
                    "fontFaceProperties": "warning",
                    "hexColorLength": "error",
                    "argumentsInColorFunction": "error",
                    "unknownProperties": "warning",
                    "ieHack": "ignore",
                    "unknownVendorSpecificProperties": "ignore",
                    "propertyIgnoredDueToDisplay": "warning",
                    "important": "ignore",
                    "float": "ignore",
                    "idSelector": "ignore"
                }
            },
            "emmet": {
                "showExpandedAbbreviation": "always",
                "showAbbreviationSuggestions": true,
                "includeLanguages": {},
                "variables": {},
                "syntaxProfiles": {},
                "excludeLanguages": [
                    "markdown"
                ],
                "extensionsPath": null,
                "triggerExpansionOnTab": false,
                "preferences": {},
                "showSuggestionsAsSnippets": false,
                "optimizeStylesheetParsing": true
            },
            "git": {
                "enabled": true,
                "path": null,
                "autoRepositoryDetection": true,
                "autorefresh": true,
                "autofetch": false,
                "confirmSync": true,
                "countBadge": "all",
                "checkoutType": "all",
                "ignoreLegacyWarning": false,
                "ignoreMissingGitWarning": false,
                "ignoreLimitWarning": false,
                "defaultCloneDirectory": null,
                "enableSmartCommit": false,
                "enableCommitSigning": false,
                "decorations": {
                    "enabled": true
                },
                "promptToSaveFilesBeforeCommit": false,
                "showInlineOpenFileAction": true,
                "inputValidation": "warn",
                "detectSubmodules": true,
                "detectSubmodulesLimit": 10
            },
            "grunt": {
                "autoDetect": "on"
            },
            "gulp": {
                "autoDetect": "on"
            },
            "html": {
                "format": {
                    "enable": true,
                    "wrapLineLength": 120,
                    "unformatted": "wbr",
                    "contentUnformatted": "pre,code,textarea",
                    "indentInnerHtml": false,
                    "preserveNewLines": true,
                    "maxPreserveNewLines": null,
                    "indentHandlebars": false,
                    "endWithNewline": false,
                    "extraLiners": "head, body, /html",
                    "wrapAttributes": "auto"
                },
                "suggest": {
                    "angular1": true,
                    "ionic": true,
                    "html5": true
                },
                "validate": {
                    "scripts": true,
                    "styles": true
                },
                "autoClosingTags": true,
                "trace": {
                    "server": "off"
                }
            },
            "jake": {
                "autoDetect": "on"
            },
            "json": {
                "schemas": [],
                "format": {
                    "enable": true
                },
                "trace": {
                    "server": "off"
                },
                "colorDecorators": {
                    "enable": true
                }
            },
            "markdown": {
                "styles": [],
                "previewFrontMatter": "hide",
                "preview": {
                    "breaks": false,
                    "linkify": true,
                    "fontFamily": "-apple-system, BlinkMacSystemFont, 'Segoe WPC', 'Segoe UI', 'HelveticaNeue-Light', 'Ubuntu', 'Droid Sans', sans-serif",
                    "fontSize": 14,
                    "lineHeight": 1.6,
                    "scrollPreviewWithEditor": true,
                    "scrollPreviewWithEditorSelection": true,
                    "markEditorSelection": true,
                    "scrollEditorWithPreview": true,
                    "doubleClickToSwitchToEditor": true
                },
                "trace": "off"
            },
            "merge-conflict": {
                "codeLens": {
                    "enabled": true
                },
                "decorators": {
                    "enabled": true
                }
            },
            "npm": {
                "autoDetect": "on",
                "runSilent": false,
                "packageManager": "npm",
                "exclude": "",
                "enableScriptExplorer": false,
                "scriptExplorerAction": "open"
            },
            "php": {
                "suggest": {
                    "basic": true
                },
                "validate": {
                    "enable": true,
                    "executablePath": null,
                    "run": "onSave"
                }
            },
            "searchRipgrep": {
                "enable": false
            },
            "typescript": {
                "tsdk": null,
                "disableAutomaticTypeAcquisition": false,
                "npm": null,
                "check": {
                    "npmIsInstalled": true
                },
                "referencesCodeLens": {
                    "enabled": false
                },
                "implementationsCodeLens": {
                    "enabled": false
                },
                "tsserver": {
                    "log": "off",
                    "pluginPaths": [],
                    "trace": "off"
                },
                "useCodeSnippetsOnMethodSuggest": false,
                "reportStyleChecksAsWarnings": true,
                "validate": {
                    "enable": true
                },
                "format": {
                    "enable": true,
                    "insertSpaceAfterCommaDelimiter": true,
                    "insertSpaceAfterConstructor": false,
                    "insertSpaceAfterSemicolonInForStatements": true,
                    "insertSpaceBeforeAndAfterBinaryOperators": true,
                    "insertSpaceAfterKeywordsInControlFlowStatements": true,
                    "insertSpaceAfterFunctionKeywordForAnonymousFunctions": true,
                    "insertSpaceBeforeFunctionParenthesis": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces": true,
                    "insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces": false,
                    "insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces": false,
                    "insertSpaceAfterTypeAssertion": false,
                    "placeOpenBraceOnNewLineForFunctions": false,
                    "placeOpenBraceOnNewLineForControlBlocks": false
                },
                "tsc": {
                    "autoDetect": "on"
                },
                "quickSuggestionsForPaths": true,
                "autoImportSuggestions": {
                    "enabled": true
                },
                "locale": null,
                "suggestionActions": {
                    "enabled": true
                },
                "preferences": {
                    "quoteStyle": "auto",
                    "importModuleSpecifier": "auto"
                },
                "showUnused": true,
                "updateImportsOnFileMove": {
                    "enabled": "prompt"
                }
            },
            "javascript": {
                "referencesCodeLens": {
                    "enabled": false
                },
                "validate": {
                    "enable": true
                },
                "format": {
                    "enable": true,
                    "insertSpaceAfterCommaDelimiter": true,
                    "insertSpaceAfterConstructor": false,
                    "insertSpaceAfterSemicolonInForStatements": true,
                    "insertSpaceBeforeAndAfterBinaryOperators": true,
                    "insertSpaceAfterKeywordsInControlFlowStatements": true,
                    "insertSpaceAfterFunctionKeywordForAnonymousFunctions": true,
                    "insertSpaceBeforeFunctionParenthesis": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces": true,
                    "insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces": false,
                    "insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces": false,
                    "placeOpenBraceOnNewLineForFunctions": false,
                    "placeOpenBraceOnNewLineForControlBlocks": false
                },
                "implicitProjectConfig": {
                    "checkJs": false,
                    "experimentalDecorators": false
                },
                "nameSuggestions": true,
                "suggestionActions": {
                    "enabled": true
                },
                "preferences": {
                    "quoteStyle": "auto",
                    "importModuleSpecifier": "auto"
                },
                "showUnused": true,
                "updateImportsOnFileMove": {
                    "enabled": "prompt"
                }
            },
            "jsDocCompletion": {
                "enabled": true
            },
            "vetur": {
                "colorDecorators": {
                    "enable": true
                },
                "completion": {
                    "autoImport": true,
                    "useScaffoldSnippets": true
                },
                "grammar": {
                    "customBlocks": {
                        "docs": "md",
                        "i18n": "json"
                    }
                },
                "validation": {
                    "template": true,
                    "style": true,
                    "script": true
                },
                "format": {
                    "defaultFormatter": {
                        "html": "none",
                        "css": "prettier",
                        "postcss": "prettier",
                        "scss": "prettier",
                        "less": "prettier",
                        "stylus": "stylus-supremacy",
                        "js": "prettier",
                        "ts": "prettier"
                    },
                    "defaultFormatterOptions": {
                        "js-beautify-html": {}
                    },
                    "styleInitialIndent": false,
                    "scriptInitialIndent": false
                },
                "trace": {
                    "server": "verbose"
                }
            },
            "[git-commit]": {
                "editor.rulers": [
                    72
                ]
            },
            "[go]": {
                "editor.insertSpaces": false
            },
            "[json]": {
                "editor.quickSuggestions": {
                    "strings": true
                }
            },
            "[makefile]": {
                "editor.insertSpaces": false
            },
            "[markdown]": {
                "editor.wordWrap": "on",
                "editor.quickSuggestions": false
            },
            "[yaml]": {
                "editor.insertSpaces": true,
                "editor.tabSize": 2,
                "editor.autoIndent": false
            }
        }
    }
}
"""

config = json.loads(config)
vim.vars['initializationOptions'] = config['initializationOptions']
EOF
