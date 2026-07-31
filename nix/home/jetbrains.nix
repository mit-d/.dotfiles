{ lib, pkgs, ... }:
let
  palette = import ../palettes/active.nix;
  colors = import ../palettes/lib.nix;

  # IntelliJ scheme values are bare hex.
  c = colors.noHash;

  # Tint toward the editor background, for the highlight backgrounds that have to
  # read as "green, but barely" rather than as a solid block of colour.
  tint = t: color: c (colors.mix palette.surface color t);

  dark = palette.variant == "dark";

  # A scheme inherits from a built-in one and overrides only what it names, so
  # this file can stay legible instead of being the ~3700 lines a fully explicit
  # scheme needs. Anything not set below is Darcula's or Default's.
  parentScheme = if dark then "Darcula" else "Default";

  # Stable, so switching palette rewrites the file rather than adding another
  # scheme and leaving the IDE pointed at the old one.
  schemeName = "dotfiles";

  attr =
    name: body:
    ''
      <option name="${name}">
        <value>
    ''
    + body
    + ''
        </value>
      </option>
    '';

  fg =
    name: color:
    attr name ''
      <option name="FOREGROUND" value="${c color}" />
    '';
  bgOnly =
    name: color:
    attr name ''
      <option name="BACKGROUND" value="${c color}" />
    '';
  wave =
    name: color:
    attr name ''
      <option name="EFFECT_COLOR" value="${c color}" />
      <option name="ERROR_STRIPE_COLOR" value="${c color}" />
      <option name="EFFECT_TYPE" value="2" />
    '';

  # base16 documents what each of its accents is for, and those roles carry over
  # to an IDE almost exactly: keywords, strings, numbers, functions, classes.
  # Using them keeps a scheme recognisable as the theme it came from.
  keyword = palette.ansi.magenta; # base0E: keywords, storage
  string = palette.ansi.green; # base0B: strings
  number = palette.orange; # base09: integers, constants
  func = palette.ansi.blue; # base0D: functions, methods
  type = palette.ansi.yellow; # base0A: classes
  variable = palette.ansi.red; # base08: variables
  support = palette.ansi.cyan; # base0C: escapes, regex
  comment = palette.onSurfaceFaint; # base03: comments

  scheme = pkgs.writeText "jetbrains-${palette.name}.icls" ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!--
      ${palette.displayName or palette.name}, generated from nix/palettes by
      nix/home/jetbrains.nix. Do not edit: rewritten on every switch.

      Editor colours only. The IDE's own chrome comes from its UI theme, which
      JetBrains loads only from a plugin, so it is not covered here. See
      ../palettes/README.md.

      No double hyphen anywhere in this comment, spelled out rather than shown
      for the obvious reason: XML forbids that sequence inside a comment, and
      this repo uses it as an ASCII em-dash everywhere else.
    -->
    <scheme name="${schemeName}" version="142" parent_scheme="${parentScheme}">
      <colors>
        <option name="CARET_COLOR" value="${c palette.cursor}" />
        <option name="CARET_ROW_COLOR" value="${c palette.surfaceContainer}" />
        <option name="SELECTION_BACKGROUND" value="${c palette.surfaceContainerHigh}" />
        <option name="SELECTION_FOREGROUND" value="${c palette.onSurfaceStrong}" />

        <option name="GUTTER_BACKGROUND" value="${c palette.surface}" />
        <option name="LINE_NUMBERS_COLOR" value="${c palette.onSurfaceFaint}" />
        <option name="LINE_NUMBER_ON_CARET_ROW_COLOR" value="${c palette.onSurface}" />
        <option name="TEARLINE_COLOR" value="${c palette.outlineVariant}" />
        <option name="SELECTED_TEARLINE_COLOR" value="${c palette.outline}" />
        <option name="INDENT_GUIDE" value="${c palette.outlineVariant}" />
        <option name="SELECTED_INDENT_GUIDE" value="${c palette.outline}" />
        <option name="RIGHT_MARGIN_COLOR" value="${c palette.outlineVariant}" />
        <option name="WHITESPACES" value="${c palette.onSurfaceFaint}" />
        <option name="VISUAL_INDENT_GUIDE" value="${c palette.outlineVariant}" />

        <option name="CONSOLE_BACKGROUND_KEY" value="${c palette.surface}" />
        <option name="DOCUMENTATION_COLOR" value="${c palette.surfaceContainer}" />
        <option name="NOTIFICATION_BACKGROUND" value="${c palette.surfaceContainer}" />
        <option name="METHOD_SEPARATORS_COLOR" value="${c palette.outlineVariant}" />

        <option name="ADDED_LINES_COLOR" value="${c palette.ansi.green}" />
        <option name="MODIFIED_LINES_COLOR" value="${c palette.ansi.blue}" />
        <option name="DELETED_LINES_COLOR" value="${c palette.error}" />
        <option name="WHITESPACES_MODIFIED_LINES_COLOR" value="${c palette.ansi.yellow}" />
        <option name="BORDER_LINES_COLOR" value="${c palette.outline}" />

        <option name="FILESTATUS_ADDED" value="${c palette.ansi.green}" />
        <option name="FILESTATUS_MODIFIED" value="${c palette.ansi.blue}" />
        <option name="FILESTATUS_DELETED" value="${c palette.onSurfaceFaint}" />
        <option name="FILESTATUS_IDEA_FILESTATUS_IGNORED" value="${c palette.onSurfaceFaint}" />
        <option name="FILESTATUS_UNKNOWN" value="${c palette.orange}" />
        <option name="FILESTATUS_MERGED_WITH_CONFLICTS" value="${c palette.error}" />

        <!-- Console ANSI, straight from the palette's sixteen slots, so program
             output in the IDE matches the same program's output in the terminal. -->
        <option name="CONSOLE_BLACK_OUTPUT" value="${c palette.ansi.black}" />
        <option name="CONSOLE_RED_OUTPUT" value="${c palette.ansi.red}" />
        <option name="CONSOLE_GREEN_OUTPUT" value="${c palette.ansi.green}" />
        <option name="CONSOLE_YELLOW_OUTPUT" value="${c palette.ansi.yellow}" />
        <option name="CONSOLE_BLUE_OUTPUT" value="${c palette.ansi.blue}" />
        <option name="CONSOLE_MAGENTA_OUTPUT" value="${c palette.ansi.magenta}" />
        <option name="CONSOLE_CYAN_OUTPUT" value="${c palette.ansi.cyan}" />
        <option name="CONSOLE_GRAY_OUTPUT" value="${c palette.ansi.white}" />
        <option name="CONSOLE_DARKGRAY_OUTPUT" value="${c palette.ansi.brightBlack}" />
        <option name="CONSOLE_RED_BRIGHT_OUTPUT" value="${c palette.ansi.brightRed}" />
        <option name="CONSOLE_GREEN_BRIGHT_OUTPUT" value="${c palette.ansi.brightGreen}" />
        <option name="CONSOLE_YELLOW_BRIGHT_OUTPUT" value="${c palette.ansi.brightYellow}" />
        <option name="CONSOLE_BLUE_BRIGHT_OUTPUT" value="${c palette.ansi.brightBlue}" />
        <option name="CONSOLE_MAGENTA_BRIGHT_OUTPUT" value="${c palette.ansi.brightMagenta}" />
        <option name="CONSOLE_CYAN_BRIGHT_OUTPUT" value="${c palette.ansi.brightCyan}" />
        <option name="CONSOLE_WHITE_OUTPUT" value="${c palette.ansi.brightWhite}" />
      </colors>
      <attributes>
        ${attr "TEXT" ''
          <option name="FOREGROUND" value="${c palette.onSurface}" />
          <option name="BACKGROUND" value="${c palette.surface}" />
        ''}
        ${fg "DEFAULT_IDENTIFIER" palette.onSurface}
        ${fg "DEFAULT_LOCAL_VARIABLE" palette.onSurface}
        ${fg "DEFAULT_PARAMETER" palette.onSurface}
        ${fg "DEFAULT_KEYWORD" keyword}
        ${fg "DEFAULT_STRING" string}
        ${fg "DEFAULT_VALID_STRING_ESCAPE" support}
        ${fg "DEFAULT_NUMBER" number}
        ${fg "DEFAULT_CONSTANT" number}
        ${fg "DEFAULT_PREDEFINED_SYMBOL" number}
        ${fg "DEFAULT_FUNCTION_DECLARATION" func}
        ${fg "DEFAULT_FUNCTION_CALL" func}
        ${fg "DEFAULT_STATIC_METHOD" func}
        ${fg "DEFAULT_CLASS_NAME" type}
        ${fg "DEFAULT_CLASS_REFERENCE" type}
        ${fg "DEFAULT_INTERFACE_NAME" type}
        ${fg "DEFAULT_INSTANCE_FIELD" variable}
        ${fg "DEFAULT_STATIC_FIELD" variable}
        ${fg "DEFAULT_INSTANCE_METHOD" func}
        ${fg "DEFAULT_METADATA" support}
        ${fg "DEFAULT_TAG" variable}
        ${fg "DEFAULT_ATTRIBUTE" number}
        ${fg "DEFAULT_ENTITY" support}
        ${fg "DEFAULT_LABEL" type}
        ${fg "DEFAULT_TEMPLATE_LANGUAGE_COLOR" palette.onSurface}

        <!-- base16 puts delimiters and operators with the default foreground
             rather than dimming them, and that is followed here. -->
        ${fg "DEFAULT_OPERATION_SIGN" palette.onSurface}
        ${fg "DEFAULT_BRACES" palette.onSurface}
        ${fg "DEFAULT_BRACKETS" palette.onSurface}
        ${fg "DEFAULT_PARENTHS" palette.onSurface}
        ${fg "DEFAULT_SEMICOLON" palette.onSurface}
        ${fg "DEFAULT_COMMA" palette.onSurface}
        ${fg "DEFAULT_DOT" palette.onSurface}

        ${fg "DEFAULT_COMMENT" comment}
        ${fg "DEFAULT_LINE_COMMENT" comment}
        ${fg "DEFAULT_BLOCK_COMMENT" comment}
        ${fg "DEFAULT_DOC_COMMENT" comment}
        ${fg "DEFAULT_DOC_MARKUP" support}
        ${fg "DEFAULT_DOC_COMMENT_TAG" palette.onSurfaceVariant}

        ${wave "ERRORS_ATTRIBUTES" palette.error}
        ${wave "WARNING_ATTRIBUTES" palette.ansi.yellow}
        ${wave "TYPO" palette.ansi.cyan}
        ${wave "WRONG_REFERENCES_ATTRIBUTES" palette.error}
        ${attr "DEPRECATED_ATTRIBUTES" ''
          <option name="FOREGROUND" value="${c palette.onSurfaceFaint}" />
          <option name="EFFECT_COLOR" value="${c palette.onSurfaceFaint}" />
          <option name="EFFECT_TYPE" value="3" />
        ''}
        ${attr "BAD_CHARACTER" ''
          <option name="BACKGROUND" value="${tint 0.35 palette.error}" />
        ''}

        ${bgOnly "IDENTIFIER_UNDER_CARET_ATTRIBUTES" palette.surfaceContainerHigh}
        ${bgOnly "WRITE_IDENTIFIER_UNDER_CARET_ATTRIBUTES" palette.surfaceContainerHighest}
        ${bgOnly "SEARCH_RESULT_ATTRIBUTES" palette.primaryContainer}
        ${bgOnly "TEXT_SEARCH_RESULT_ATTRIBUTES" palette.primaryContainer}
        ${bgOnly "MATCHED_BRACE_ATTRIBUTES" palette.surfaceContainerHighest}
        ${attr "UNMATCHED_BRACE_ATTRIBUTES" ''
          <option name="BACKGROUND" value="${tint 0.35 palette.error}" />
        ''}

        <!-- Diff and inspection backgrounds are tinted toward the editor
             background: the full accent as a block colour is unreadable behind
             text, which is why lib.nix has a mix at all. -->
        ${attr "DIFF_INSERTED" ''
          <option name="BACKGROUND" value="${tint 0.22 palette.ansi.green}" />
          <option name="ERROR_STRIPE_COLOR" value="${c palette.ansi.green}" />
        ''}
        ${attr "DIFF_MODIFIED" ''
          <option name="BACKGROUND" value="${tint 0.22 palette.ansi.blue}" />
          <option name="ERROR_STRIPE_COLOR" value="${c palette.ansi.blue}" />
        ''}
        ${attr "DIFF_DELETED" ''
          <option name="BACKGROUND" value="${tint 0.22 palette.error}" />
          <option name="ERROR_STRIPE_COLOR" value="${c palette.error}" />
        ''}
        ${attr "DIFF_CONFLICT" ''
          <option name="BACKGROUND" value="${tint 0.22 palette.orange}" />
          <option name="ERROR_STRIPE_COLOR" value="${c palette.orange}" />
        ''}
        ${bgOnly "DELETED_TEXT_ATTRIBUTES" (colors.mix palette.surface palette.error 0.3)}

        ${attr "CONSOLE_ERROR_OUTPUT" ''
          <option name="FOREGROUND" value="${c palette.error}" />
        ''}
        ${fg "CONSOLE_SYSTEM_OUTPUT" palette.onSurfaceVariant}
        ${fg "CONSOLE_USER_INPUT" palette.ansi.green}
        ${fg "LOG_ERROR_OUTPUT" palette.error}
        ${fg "LOG_WARNING_OUTPUT" palette.ansi.yellow}
        ${fg "LOG_DEBUG_OUTPUT" palette.onSurfaceVariant}
        ${fg "LOG_INFO_OUTPUT" palette.onSurface}

        ${fg "TODO_DEFAULT_ATTRIBUTES" palette.ansi.yellow}
        ${bgOnly "BREADCRUMBS_CURRENT" palette.surfaceContainerHigh}
        ${bgOnly "BREADCRUMBS_HOVERED" palette.surfaceContainer}
        ${bgOnly "INLINE_PARAMETER_HINT" palette.surfaceContainerHigh}
        ${fg "INLAY_DEFAULT" palette.onSurfaceVariant}
      </attributes>
    </scheme>
  '';

  # --- UI theme -------------------------------------------------------------
  #
  # The editor scheme above covers the editor. The IDE's own chrome comes from a
  # *.theme.json, which the platform only loads from a plugin, so this builds one.
  #
  # A theme plugin carries no code: it is a jar holding plugin.xml, the theme
  # json, and the editor scheme it references. A malformed one is disabled with a
  # notification rather than breaking the IDE.

  # Stable, because laf.xml refers to the theme by this id. Regenerating it per
  # palette would leave every IDE pointing at a theme that no longer exists.
  themeId = "b7c1e0a4-5d2f-4a63-9c18-3e6f0d5a9b47";
  pluginId = "dotfiles.palette.theme";

  withAlpha = a: color: "#" + c color + a;

  themeJson = pkgs.writeText "dotfiles.theme.json" (
    builtins.toJSON {
      name = schemeName;
      inherit dark;
      author = "generated from nix/palettes";
      # Folds the editor scheme into the theme, so selecting it sets both the
      # chrome and the editor in one go.
      editorScheme = "/${schemeName}.xml";

      ui = {
        # The platform matches this against any component key ending in these
        # names, which is what covers most of the chrome without naming every
        # widget. Everything below it is a correction, not a foundation.
        "*" = {
          background = "#${c palette.surface}";
          foreground = "#${c palette.onSurface}";
          infoForeground = "#${c palette.onSurfaceVariant}";
          disabledForeground = "#${c palette.onSurfaceFaint}";
          inactiveForeground = "#${c palette.onSurfaceVariant}";
          acceleratorForeground = "#${c palette.onSurfaceVariant}";
          errorForeground = "#${c palette.error}";

          selectionBackground = "#${c palette.surfaceContainerHighest}";
          selectionForeground = "#${c palette.onSurfaceStrong}";
          selectionInactiveBackground = "#${c palette.surfaceContainerHigh}";
          selectionBackgroundInactive = "#${c palette.surfaceContainerHigh}";
          selectedBackground = "#${c palette.surfaceContainerHigh}";
          selectedForeground = "#${c palette.onSurfaceStrong}";
          selectedInactiveBackground = "#${c palette.surfaceContainer}";
          selectedBackgroundInactive = "#${c palette.surfaceContainer}";
          lightSelectionBackground = "#${c palette.surfaceContainerHigh}";
          hoverBackground = "#${c palette.surfaceContainer}";

          borderColor = "#${c palette.outlineVariant}";
          disabledBorderColor = "#${c palette.outlineVariant}";
          focusedBorderColor = "#${c palette.primary}";
          separatorColor = "#${c palette.outlineVariant}";
          modifiedItemForeground = "#${c palette.ansi.blue}";
        };

        ActionButton = {
          hoverBackground = "#${c palette.surfaceContainerHigh}";
          pressedBackground = "#${c palette.surfaceContainerHighest}";
        };

        Button = {
          startBackground = "#${c palette.surfaceContainer}";
          endBackground = "#${c palette.surfaceContainer}";
          startBorderColor = "#${c palette.outlineVariant}";
          endBorderColor = "#${c palette.outlineVariant}";
          focusedBorderColor = "#${c palette.primary}";
          default = {
            foreground = "#${c palette.onPrimary}";
            startBackground = "#${c palette.primary}";
            endBackground = "#${c palette.primary}";
            startBorderColor = "#${c palette.primary}";
            endBorderColor = "#${c palette.primary}";
            focusedBorderColor = "#${c palette.primaryContainer}";
          };
        };

        ComboBox = {
          nonEditableBackground = "#${c palette.surfaceContainer}";
          ArrowButton = {
            background = "#${c palette.surfaceContainer}";
            nonEditableBackground = "#${c palette.surfaceContainer}";
            iconColor = "#${c palette.onSurfaceVariant}";
            disabledIconColor = "#${c palette.onSurfaceFaint}";
          };
        };

        Component = {
          focusedBorderColor = "#${c palette.primary}";
          focusColor = "#${c palette.primary}";
          errorFocusColor = "#${c palette.error}";
          inactiveErrorFocusColor = "#${c palette.error}";
          warningFocusColor = "#${c palette.ansi.yellow}";
          inactiveWarningFocusColor = "#${c palette.ansi.yellow}";
        };

        # Named explicitly because the wildcard leaves the completion popup and
        # the run widget looking like the old theme, which is the first thing you
        # notice.
        CompletionPopup = {
          background = "#${c palette.surfaceContainer}";
          foreground = "#${c palette.onSurface}";
          selectionBackground = "#${c palette.surfaceContainerHighest}";
          selectionInactiveBackground = "#${c palette.surfaceContainerHigh}";
          matchForeground = "#${c palette.primary}";
        };

        Editor.background = "#${c palette.surface}";

        EditorTabs = {
          background = "#${c palette.surfaceContainer}";
          selectedBackground = "#${c palette.surface}";
          selectedForeground = "#${c palette.onSurfaceStrong}";
          underlinedTabBackground = "#${c palette.surface}";
          underlinedTabForeground = "#${c palette.onSurfaceStrong}";
          underlineColor = "#${c palette.primary}";
          inactiveUnderlineColor = "#${c palette.outline}";
          hoverBackground = "#${c palette.surfaceContainerHigh}";
          borderColor = "#${c palette.outlineVariant}";
        };

        Link = {
          activeForeground = "#${c palette.primary}";
          hoverForeground = "#${c palette.primary}";
          pressedForeground = "#${c palette.primary}";
          visitedForeground = "#${c palette.tertiary}";
        };

        MainToolbar = {
          background = "#${c palette.surfaceContainer}";
          inactiveBackground = "#${c palette.surfaceContainer}";
          Dropdown.hoverBackground = "#${c palette.surfaceContainerHigh}";
          Icon.hoverBackground = "#${c palette.surfaceContainerHigh}";
        };

        NewClass.Panel.background = "#${c palette.surfaceContainer}";

        Notification = {
          background = "#${c palette.surfaceContainer}";
          borderColor = "#${c palette.outlineVariant}";
          errorBackground = "#${c palette.surfaceContainer}";
          errorBorderColor = "#${c palette.error}";
          MoreButton.background = "#${c palette.surfaceContainerHigh}";
          ToolWindow = {
            informativeBackground = "#${c palette.surfaceContainer}";
            informativeBorderColor = "#${c palette.outlineVariant}";
            warningBackground = "#${c palette.surfaceContainer}";
            warningBorderColor = "#${c palette.ansi.yellow}";
            errorBackground = "#${c palette.surfaceContainer}";
            errorBorderColor = "#${c palette.error}";
          };
        };

        Popup = {
          background = "#${c palette.surfaceContainer}";
          borderColor = "#${c palette.outline}";
          separatorColor = "#${c palette.outlineVariant}";
          Header = {
            activeBackground = "#${c palette.surfaceContainerHigh}";
            inactiveBackground = "#${c palette.surfaceContainer}";
          };
          Toolbar.background = "#${c palette.surfaceContainer}";
          Advertiser = {
            background = "#${c palette.surfaceContainer}";
            foreground = "#${c palette.onSurfaceFaint}";
          };
        };

        ProgressBar = {
          progressColor = "#${c palette.primary}";
          indeterminateStartColor = "#${c palette.primary}";
          indeterminateEndColor = "#${c palette.primaryContainer}";
          trackColor = "#${c palette.surfaceContainerHigh}";
          passedColor = "#${c palette.ansi.green}";
          failedColor = "#${c palette.error}";
        };

        RunWidget = {
          background = "#${c palette.primary}";
          foreground = "#${c palette.onPrimary}";
          hoverBackground = "#${c palette.primaryContainer}";
          pressedBackground = "#${c palette.primaryContainer}";
          separatorColor = "#${c palette.outlineVariant}";
        };

        ScrollBar = {
          background = "#${c palette.surface}";
          track = "#${c palette.surface}";
          thumb = "#${c palette.outlineVariant}";
          thumbColor = "#${c palette.outlineVariant}";
          thumbBorderColor = "#${c palette.outlineVariant}";
          hoverThumbColor = "#${c palette.outline}";
          hoverThumbBorderColor = "#${c palette.outline}";
          hoverTrackColor = "#${c palette.surfaceContainer}";
          Transparent = {
            thumbColor = "#${c palette.outlineVariant}";
            thumbBorderColor = "#${c palette.outlineVariant}";
            hoverThumbColor = "#${c palette.outline}";
            hoverThumbBorderColor = "#${c palette.outline}";
          };
        };

        SearchEverywhere = {
          Header.background = "#${c palette.surfaceContainer}";
          SearchField = {
            background = "#${c palette.surfaceContainerLow}";
            borderColor = "#${c palette.outlineVariant}";
            infoForeground = "#${c palette.onSurfaceFaint}";
          };
          Tab = {
            selectedBackground = "#${c palette.surfaceContainerHigh}";
            selectedForeground = "#${c palette.onSurfaceStrong}";
          };
          Advertiser.background = "#${c palette.surfaceContainer}";
        };

        SearchMatch = {
          startBackground = "#${c palette.primaryContainer}";
          endBackground = "#${c palette.primaryContainer}";
        };

        StatusBar = {
          background = "#${c palette.surfaceContainer}";
          borderColor = "#${c palette.outlineVariant}";
          hoverBackground = "#${c palette.surfaceContainerHigh}";
        };

        TabbedPane = {
          underlineColor = "#${c palette.primary}";
          contentAreaColor = "#${c palette.outlineVariant}";
          focusColor = "#${c palette.surfaceContainerHigh}";
          hoverColor = "#${c palette.surfaceContainerHigh}";
        };

        Table = {
          background = "#${c palette.surface}";
          stripeColor = "#${c palette.surfaceContainerLow}";
          gridColor = "#${c palette.outlineVariant}";
          lightSelectionBackground = "#${c palette.surfaceContainerHigh}";
          lightSelectionForeground = "#${c palette.onSurfaceStrong}";
          lightSelectionInactiveBackground = "#${c palette.surfaceContainer}";
          lightSelectionInactiveForeground = "#${c palette.onSurfaceVariant}";
          TableHeader = {
            background = "#${c palette.surfaceContainer}";
            bottomSeparatorColor = "#${c palette.outlineVariant}";
          };
        };

        ToolBar = {
          background = "#${c palette.surfaceContainer}";
          borderHandleColor = "#${c palette.outline}";
        };

        ToolWindow = {
          background = "#${c palette.surfaceContainer}";
          Header = {
            background = "#${c palette.surfaceContainer}";
            inactiveBackground = "#${c palette.surfaceContainer}";
            borderColor = "#${c palette.outlineVariant}";
          };
          HeaderTab = {
            selectedInactiveBackground = "#${c palette.surfaceContainerHigh}";
            selectedBackground = "#${c palette.surfaceContainerHigh}";
            hoverBackground = "#${c palette.surfaceContainerHigh}";
            hoverInactiveBackground = "#${c palette.surfaceContainer}";
            underlineColor = "#${c palette.primary}";
            inactiveUnderlineColor = "#${c palette.outline}";
          };
          Button = {
            hoverBackground = "#${c palette.surfaceContainerHigh}";
            selectedBackground = "#${c palette.surfaceContainerHighest}";
            selectedForeground = "#${c palette.onSurfaceStrong}";
          };
        };

        Tree = {
          background = "#${c palette.surface}";
          foreground = "#${c palette.onSurface}";
          selectionBackground = "#${c palette.surfaceContainerHighest}";
          selectionForeground = "#${c palette.onSurfaceStrong}";
          selectionInactiveBackground = "#${c palette.surfaceContainerHigh}";
          hoverBackground = "#${c palette.surfaceContainer}";
          modifiedItemForeground = "#${c palette.ansi.blue}";
          rowHeight = 22;
        };

        ValidationTooltip = {
          errorBackground = "#${c palette.surfaceContainer}";
          errorBorderColor = "#${c palette.error}";
          warningBackground = "#${c palette.surfaceContainer}";
          warningBorderColor = "#${c palette.ansi.yellow}";
        };

        VersionControl.RefLabel = {
          backgroundBase = "#${c palette.surfaceContainerHigh}";
          foreground = "#${c palette.onSurfaceVariant}";
        };

        # Faint washes, so a coloured file in the tree stays readable. The alpha
        # suffix is the platform's own convention for these.
        FileColor = {
          Blue = withAlpha "22" palette.ansi.blue;
          Green = withAlpha "22" palette.ansi.green;
          Orange = withAlpha "22" palette.orange;
          Rose = withAlpha "22" palette.error;
          Violet = withAlpha "22" palette.ansi.magenta;
          Yellow = withAlpha "22" palette.ansi.yellow;
        };
      };

      # Recolours the platform's own icons, which otherwise keep the previous
      # theme's accents and are the last thing to look out of place.
      icons.ColorPalette = {
        "Actions.Red" = "#${c palette.error}";
        "Actions.Yellow" = "#${c palette.ansi.yellow}";
        "Actions.Green" = "#${c palette.ansi.green}";
        "Actions.Blue" = "#${c palette.ansi.blue}";
        "Actions.Grey" = "#${c palette.onSurfaceVariant}";
        "Actions.GreyInline" = "#${c palette.onSurfaceVariant}";
        "Actions.GreyInline.Dark" = "#${c palette.onSurfaceVariant}";
        "Objects.Grey" = "#${c palette.onSurfaceVariant}";
        "Objects.RedStatus" = "#${c palette.error}";
        "Objects.Red" = "#${c palette.error}";
        "Objects.Pink" = "#${c palette.ansi.magenta}";
        "Objects.Yellow" = "#${c palette.ansi.yellow}";
        "Objects.Green" = "#${c palette.ansi.green}";
        "Objects.Blue" = "#${c palette.ansi.blue}";
        "Objects.Purple" = "#${c palette.ansi.magenta}";
        "Objects.BlackText" = "#${c palette.onSurface}";
        "Objects.YellowDark" = "#${c palette.ansi.yellow}";
        "Objects.GreenAndroid" = "#${c palette.ansi.green}";
        "Checkbox.Background.Default" = "#${c palette.surfaceContainer}";
        "Checkbox.Border.Default" = "#${c palette.outline}";
        "Checkbox.Foreground.Selected" = "#${c palette.onPrimary}";
        "Checkbox.Background.Selected" = "#${c palette.primary}";
        "Checkbox.Focus.Wide" = "#${c palette.primary}";
      };
    }
  );

  # since-build only, with no until-build: an upper bound is what makes a theme
  # silently vanish after an IDE upgrade. Depends on modules.platform rather than
  # modules.lang so DataGrip and the other non-language IDEs load it too.
  pluginXml = pkgs.writeText "plugin.xml" ''
    <idea-plugin>
      <id>${pluginId}</id>
      <name>${schemeName} palette</name>
      <version>${palette.version}</version>
      <vendor>generated from nix/palettes</vendor>
      <description>Generated from nix/palettes. Follows the active palette.</description>
      <idea-version since-build="223" />
      <depends>com.intellij.modules.platform</depends>
      <extensions defaultExtensionNs="com.intellij">
        <themeProvider id="${themeId}" path="/${schemeName}.theme.json" />
      </extensions>
    </idea-plugin>
  '';

  themePlugin =
    pkgs.runCommand "jetbrains-${palette.name}-theme.jar" { nativeBuildInputs = [ pkgs.zip ]; }
      ''
        mkdir -p build/META-INF
        cp ${pluginXml} build/META-INF/plugin.xml
        cp ${themeJson} build/${schemeName}.theme.json
        cp ${scheme} build/${schemeName}.xml
        cd build
        zip -q -r -X "$out" META-INF ${schemeName}.theme.json ${schemeName}.xml
      '';

  # Selecting the scheme means editing a file the IDE owns and rewrites, so the
  # one element is patched rather than the file replaced -- colors.scheme.xml also
  # carries font settings in some versions, and writing it wholesale would drop
  # them.
  selectScheme = pkgs.writeText "jetbrains-select-scheme.py" ''
    import sys
    import xml.etree.ElementTree as ET

    path, name = sys.argv[1], sys.argv[2]

    try:
        tree = ET.parse(path)
        root = tree.getroot()
    except (OSError, ET.ParseError):
        root = ET.Element("application")
        tree = ET.ElementTree(root)

    if root.tag != "application":
        sys.exit(0)

    component = None
    for candidate in root.findall("component"):
        if candidate.get("name") == "EditorColorsManagerImpl":
            component = candidate
            break
    if component is None:
        component = ET.SubElement(root, "component", {"name": "EditorColorsManagerImpl"})

    scheme = component.find("global_color_scheme")
    if scheme is None:
        scheme = ET.SubElement(component, "global_color_scheme")
    if scheme.get("name") == name:
        sys.exit(0)

    scheme.set("name", name)
    tree.write(path, encoding="UTF-8", xml_declaration=False)
  '';

  # laf.xml is the same shape of problem as colors.scheme.xml, so the same
  # element-wise approach.
  #
  # Both preferred-*-laf entries are set as well as <laf>, because which one the
  # IDE reads depends on whether "Sync with OS" is on and this config does not
  # own that choice. The palette has a single variant, so pointing both at it is
  # correct either way -- and macOS light/dark already follows `variant` through
  # nix/darwin/defaults.nix.
  selectLaf = pkgs.writeText "jetbrains-select-laf.py" ''
    import sys
    import xml.etree.ElementTree as ET

    path, theme_id, class_name = sys.argv[1], sys.argv[2], sys.argv[3]

    try:
        tree = ET.parse(path)
        root = tree.getroot()
    except (OSError, ET.ParseError):
        root = ET.Element("application")
        tree = ET.ElementTree(root)

    if root.tag != "application":
        sys.exit(0)

    component = None
    for candidate in root.findall("component"):
        if candidate.get("name") == "LafManager":
            component = candidate
            break
    if component is None:
        component = ET.SubElement(root, "component", {"name": "LafManager"})

    changed = False
    for tag in ("laf", "preferred-light-laf", "preferred-dark-laf"):
        element = component.find(tag)
        if element is None:
            element = ET.SubElement(component, tag)
        if element.get("themeId") != theme_id or element.get("class-name") != class_name:
            element.set("class-name", class_name)
            element.set("themeId", theme_id)
            changed = True

    if changed:
        tree.write(path, encoding="UTF-8", xml_declaration=False)
  '';

  # A custom theme still declares one of the two built-in base LaFs.
  lafClass =
    if dark then
      "com.intellij.ide.ui.laf.darcula.DarculaLaf"
    else
      "com.intellij.ide.ui.laf.IntelliJLaf";

  # IDE configs to install the UI theme plugin into, by directory name.
  #
  # Deliberately one to start with: the chrome needs looking at, and a wrong
  # colour found after installing everywhere costs a restart of every IDE. Widen
  # this list once it looks right.
  #
  # An IDE listed here gets the editor scheme from inside the plugin, via the
  # theme's editorScheme, and must therefore NOT also get the standalone .icls --
  # two schemes both named "dotfiles" is ambiguous.
  themePluginIdes = [ "PyCharm2026.1" ];
in
{
  # Every JetBrains IDE reads schemes from <config>/colors, so one generated file
  # is dropped into each. The directories are discovered rather than listed:
  # there are six IDE families here across a dozen versions, and Toolbox adds a
  # new one on every major upgrade.
  home.activation.jetbrainsPalette = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    jetbrains="$HOME/Library/Application Support/JetBrains"
    if [ -d "$jetbrains" ]; then
      for dir in "$jetbrains"/*; do
        [ -d "$dir" ] || continue

        # Only real, current IDE configs. The pattern excludes the sibling
        # directories that are not IDEs (Toolbox, Fleet, consentOptions) and the
        # _bak and -backup copies left behind by upgrades, which would otherwise
        # get a scheme they can never show.
        case "$(basename "$dir")" in
          IntelliJIdea[0-9]*.[0-9] | PyCharm[0-9]*.[0-9] | WebStorm[0-9]*.[0-9] \
          | DataGrip[0-9]*.[0-9] | CLion[0-9]*.[0-9] | RustRover[0-9]*.[0-9] \
          | GoLand[0-9]*.[0-9] | RubyMine[0-9]*.[0-9] | PhpStorm[0-9]*.[0-9] \
          | Rider[0-9]*.[0-9] | DataSpell[0-9]*.[0-9] | Aqua[0-9]*.[0-9]) ;;
          *) continue ;;
        esac

        run mkdir -p "$dir/colors" "$dir/options"

        case " ${lib.concatStringsSep " " themePluginIdes} " in
          *" $(basename "$dir") "*)
            # UI theme plugin, which carries the editor scheme with it.
            run mkdir -p "$dir/plugins"
            run install -m 644 ${themePlugin} \
              "$dir/plugins/${schemeName}-palette-theme.jar"
            run ${pkgs.python3}/bin/python3 ${selectLaf} \
              "$dir/options/laf.xml" "${themeId}" "${lafClass}"
            # Would otherwise collide with the copy inside the plugin.
            run rm -f "$dir/colors/${schemeName}.icls"
            ;;
          *)
            # Editor scheme only. Also clears the plugin, so narrowing the list
            # above actually removes it rather than leaving it installed.
            run install -m 644 ${scheme} "$dir/colors/${schemeName}.icls"
            run rm -f "$dir/plugins/${schemeName}-palette-theme.jar"
            ;;
        esac

        run ${pkgs.python3}/bin/python3 ${selectScheme} \
          "$dir/options/colors.scheme.xml" "${schemeName}"
      done
      echo "jetbrains: '${schemeName}' installed; restart any running IDE," \
           "which rewrites these files on exit"
      echo "jetbrains: UI theme in ${lib.concatStringsSep ", " themePluginIdes};" \
           "editor scheme only elsewhere"
    fi
  '';
}
