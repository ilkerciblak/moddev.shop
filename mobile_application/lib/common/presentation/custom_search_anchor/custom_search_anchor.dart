// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_element
import 'dart:async';

import 'package:flutter/material.dart';

// TODO-LIST:
// # Layout based isFullScreen pre-definition
// # I18N
// # Factory Constructors Based on scenario's (maybe?)

class CustomSearchAnchor<T> extends StatefulWidget {
  ///  `Optional`
  ///
  ///[SearchController] that allows open or close the search view
  /// from other widgets
  ///
  /// If it is null, a default searchController is created automatically
  /// and it is used in [suggestionBuilder, viewOnSubmitted] inner methods
  final SearchController? searchController;

  /// `Optional`
  ///
  /// Whether the search view grows to fill the entire screen when the
  /// [SearchAnchor] is tapped.
  ///
  /// By default, the searchview is full-screen.
  final bool isFullScreen;

  /// `Optional`
  ///
  /// Text that is displayed on the search field when the query is empty.
  /// Should be used to describe what to search or how to search.
  /// Predefined as `Search`
  final String queryHintText;

  /// `Optional`
  ///
  /// Logical description for the users has requested to search field to perform
  /// predefined as `TextInputAction.Search`
  ///
  /// Futher information on [Flutter API Documentation on TextInputAction](https://api.flutter.dev/flutter/flutter_test/TextInputAction.html)
  final TextInputAction textInputAction;

  ///  `Optional`
  ///
  ///Parameter to configure keyboard apperance based on expected input type, such as
  /// [email, phone, number]
  ///
  /// Further information on [Flutter API Documentation on TextInputType](https://api.flutter.dev/flutter/services/TextInputType-class.html)
  final TextInputType? textInputType;

  ///  `Optional`
  ///
  ///widget to display before the search field on search view.
  ///
  /// Typically the [leadingWidget] is a [IconButton]
  ///
  /// Predefined as a back button which pops out the search view without any extra action.
  final Widget? leadingWidget;

  ///  `Optional`
  ///
  ///widget list to display after the search field on search view.
  ///
  /// Typically the [trailingWidgetList] widget list only has one or two widgets for
  /// portrait landscapes.
  ///
  /// Defaults to an icon button with [Icons.close] which clears the text input in search field
  final List<Widget>? trailingWidgetList;

  ///  `Optional`
  ///
  ///Parameter to set divider color between search field and suggestion view
  ///
  /// If this property is null (not assinged), then [SearchViewThemeData.dividerColor] is used.
  /// If that is also null, the default value is [ColorScheme.outline].
  final Color? dividerColor;

  ///  `Optional`
  ///
  ///Parameter to set search view background color, including whole screen
  ///
  /// If this property is null or not assigned, then [SearchViewThemeData.backgoundColor] will be used.
  /// If [SearchViewThemeData.backgroundColor] is also null, then the default value is [ColorScheme.surfaceContainerHigh]
  final Color? viewBackgroundColor;

  ///  `Optional`
  ///
  ///Parameter to set search fild input text style of the search view.
  ///
  /// If null, the value of [SearchViewThemeData.headerTextStyle] will be used.
  /// If this is null also, defaults to the [bodyLarge] text style of the current [Theme]
  final TextStyle? headerTextStyle;

  ///  `Optional`
  ///
  /// Parameter to set search field hint text style of the search view.
  ///
  /// If null, the value of [SearchViewThemeData.headerHintStyle] will be used.
  /// If this is also null, the value of [SearchViewThemeData.headerTextStyle] will be used. If this is also null,
  /// defaults to the `bodyLarge` text style from the current [Theme]. The default
  /// text color is [ColorScheme.onSurfaceVariant].
  final TextStyle? headerHintStyle;

  ///  `Optional`
  ///
  /// void Function(SearchController controller) method that,
  ///
  /// called when the user indicated that they are done editing the text int the
  /// search field of a search view by pressing the submit button on the keyboard or submit
  /// triggering gesture detector.
  ///
  /// For an example, can be used to close search view and trigger a filtered fetch for
  /// listing view.
  ///
  /// ```dart
  /// viewOnSubmittedFunction: (controller){
  ///   // In order to show queryText on the searchbar placed top of the
  ///   // listing view
  ///   controller.closeView(controller.text);
  ///   // Altering the shown list with filtered fetched list
  ///   var list = await someRepository.getFilteredList(controller.text);
  /// }
  final ViewOnSubmittedFunction? viewOnSubmittedFunction;

  /// `Optional`
  ///
  ///  Fetching method to fetch filtered [T] typed results based on query string.
  ///
  /// [ResultFetchingFunction] typed function returns [FutureOr<List<T>>] in order to use
  /// synchronous and/or asynchronous methods to filter results
  ///
  /// For an example:
  ///
  /// cached items checked first it some results in there, if not db query is runned.
  /// ```dart
  ///
  /// resultsFetchingFunction: (searchText) async {
  ///    final cachedData = prefs.getString(searchText);
  ///
  ///     if (cachedData != null) {
  ///       return cachedData; // Return cached value directly
  ///     }
  ///
  ///    // Fallback to asynchronous database fetch
  ///    return await _fetchValueFromDatabase(searchText);
  /// }
  ///
  final ResultFetchingFunction<T>? resultFetchingFunction;

  /// `Optional`
  ///
  ///  Widget Function(T value) that,
  ///
  ///  Called to create a widget to present each of the filtered
  /// results. Will only build on successfull filtering.
  ///
  /// See also:
  /// - [errorBuilder]
  /// - [loadingBuilder]
  /// - [searchSuggesstionBuilder]
  ///
  ///
  /// For example:
  /// ```dart
  /// resultsBuilder: (product) =>
  ///         ProductListComponent(
  ///           product: product,
  ///         ),
  /// ```
  final WidgetBuilderFunction<T>? resultsBuilder;

  /// `Optional`
  ///
  /// Widget Function(String value) that,
  ///
  /// Called to create a widget to present each of the search suggesstions, like
  /// cached search texts or mostly used search queries.
  ///
  /// For example:
  /// ```dart
  ///    searchSuggesstionBuilder: (txt) => Text(txt),
  /// ```
  final WidgetBuilderFunction<String>? searchSuggesstionBuilder;

  /// `Required`
  ///
  /// Widget Function(BuildContext, SearchController) that,
  ///
  /// Called to create a Widget that triggers search view when it is tapped.
  ///
  /// Typically triggering widget is a [TextField]/[TextFormField] or [IconButton]
  ///
  /// See also:
  /// -  factory constructor [CustomSearchAnchor.icon]
  final BuilderFunction builder;

  /// `Optional`
  ///
  /// Callback to create a widget to lay out the suggestion and/or result list
  /// of the search view.
  ///
  /// Default view uses a [ListView] with a verticall scroll direction.
  final Widget Function(List<Widget> suggesstions, List<Widget> results)?
      viewBuilderFunction;

  final Widget? loadingBuilder;

  final bool initialRun;

  factory CustomSearchAnchor.bar() => _CustomSearchAnchorWithBar();

  ///`Factory constructor`
  ///
  /// Creates a [CustomSearchAnchor] with a [IconButton] which opens a search view.
  ///
  /// Defaults to [Icons.search_sharp] if icon parameter is not assigned
  factory CustomSearchAnchor.icon({
    IconData icon = Icons.search_sharp,
    Widget? leadingWidget,
    List<Widget>? trailingWidgetList,
    Color? dividerColor,
    Color? viewBackgroundColor,
    TextStyle? headerTextStyle,
    TextStyle? headerHintStyle,
    TextInputType? textInputType,
    void Function(SearchController)? viewOnSubmittedFunction,
    Widget Function(String)? searchSuggesstionBuilder,
    FutureOr<List<T>> Function(String)? resultFetchingFunction,
    Widget Function(T)? resultsBuilder,
    Widget Function(List<Widget>, List<Widget>)? viewBuilderFunction,
    Widget? loadingBuilder,
    bool isFullScreen = true,
    String queryHintText = 'Search',
    TextInputAction textInputAction = TextInputAction.search,
    void Function()? onTap,
  }) =>
      _CustomSearchAnchorWithIcon<T>(
        icon: icon,
        onTap: onTap,
        isFullScreen: isFullScreen,
        dividerColor: dividerColor,
        queryHintText: queryHintText,
        viewBackgroundColor: viewBackgroundColor,
        leadingWidget: leadingWidget,
        trailingWidgetList: trailingWidgetList,
        headerHintStyle: headerHintStyle,
        headerTextStyle: headerTextStyle,
        textInputAction: textInputAction,
        textInputType: textInputType,
        resultFetchingFunction: resultFetchingFunction,
        resultsBuilder: resultsBuilder,
        searchSuggesstionBuilder: searchSuggesstionBuilder,
        viewBuilderFunction: viewBuilderFunction,
        viewOnSubmittedFunction: viewOnSubmittedFunction,
        loadingBuilder: loadingBuilder,
      );

  CustomSearchAnchor({
    super.key,
    this.searchController,
    this.leadingWidget,
    this.trailingWidgetList,
    this.dividerColor,
    this.viewBackgroundColor,
    this.headerTextStyle,
    this.headerHintStyle,
    this.textInputType,
    this.viewOnSubmittedFunction,
    required this.builder,
    this.searchSuggesstionBuilder,
    this.resultFetchingFunction,
    this.resultsBuilder,
    this.isFullScreen = true,
    this.queryHintText = 'Search',
    this.textInputAction = TextInputAction.search,
    this.viewBuilderFunction,
    this.loadingBuilder,
    this.initialRun = false,
  }) {
    assert(searchSuggesstionBuilder != null || resultsBuilder != null,
        'Search Suggestion Builder and Result Builder Functions both not assigned');
  }
  @override
  State<CustomSearchAnchor> createState() => _CustomSearchAnchorState<T>();
}

class _CustomSearchAnchorState<T> extends State<CustomSearchAnchor<T>>
    with _SearchAnchorBuilderMixin {
  late List<String> searchSuggestions;

  late List<T> results;
  late SearchController searchController;
  late bool isLoading = false;

  @override
  void initState() {
    searchController = widget.searchController ?? SearchController();
    results = <T>[];
    searchSuggestions = <String>[];

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  Future<void> _updateSuggestions() async {
    var originalQuery = searchController.text;

    // sickening solution to re-build suggesstion view but we gonna built an search view soon :))) very excited!
    setState(() {
      searchController.text = '$originalQuery\u200B';
      searchController.text = originalQuery;
    });
    results =
        await widget.resultFetchingFunction?.call(searchController.text) ?? [];
    setState(() {
      isLoading = false;
      results;
      searchController.text = '$originalQuery\u200B';
      searchController.text = originalQuery;
    });
  }

  List<Widget>? _noResultBuilder() {
    return searchController.text.isNotEmpty
        ? const [
            Center(
              heightFactor: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_sharp,
                    size: 40,
                  ),
                  Text('No result was found for your query')
                ],
              ),
            )
          ]
        : null;
  }

  Widget _loadingBuilder() {
    return widget.loadingBuilder ?? const CircularProgressIndicator.adaptive();
  }

  @override
  Widget build(BuildContext context) {
    return buildSearchAnchor(
      context,
      searchController: searchController,
      builder: widget.builder,
      dividerColor: widget.dividerColor,
      viewBackgroundColor: widget.viewBackgroundColor,
      isFullScreen: widget.isFullScreen,
      leadingWidget: widget.leadingWidget,
      trailingWidgetList: widget.trailingWidgetList,
      queryHintText: widget.queryHintText,
      headerTextStyle: widget.headerTextStyle,
      headerHintStyle: widget.headerHintStyle,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      viewOnSubmitted: (query, controller) async {
        widget.viewOnSubmittedFunction?.call(controller);
        // In order to construct this project
        setState(() {
          isLoading = true;
        });
        await _updateSuggestions();
      },
      viewBuilder: widget.viewBuilderFunction != null
          ? (suggestions) {
              List<Widget> searchWidgets =
                  widget.searchSuggesstionBuilder != null
                      ? searchSuggestions
                          .map(
                            (e) => widget.searchSuggesstionBuilder!.call(e),
                          )
                          .toList()
                      : [];

              List<Widget> resultWidgets = widget.resultsBuilder != null
                  ? results
                      .map(
                        (e) => widget.resultsBuilder!.call(e),
                      )
                      .toList()
                  : [];

              return widget.viewBuilderFunction!
                  .call(searchWidgets, resultWidgets);
            }
          : null,
      suggestionsBuilder: (context, controller) async {
        if (widget.initialRun) {
          results =
              await widget.resultFetchingFunction?.call(controller.text) ?? [];

          // await _updateSuggestions();
        }
        if (widget.resultsBuilder != null && results.isNotEmpty && !isLoading) {
          return results.map((e) => widget.resultsBuilder!.call(e)).toList();
        }
        if (isLoading) {
          return List.generate(
            10,
            (index) {
              return _loadingBuilder();
            },
          );
        }

        // TODO: Search baslamadan once var ise search onerileri olmali
        return _noResultBuilder() ?? [];
      },
    );
  }
}

class _CustomSearchAnchorWithIcon<T> extends CustomSearchAnchor<T> {
  final IconData icon;
  _CustomSearchAnchorWithIcon({
    this.icon = Icons.search_sharp,
    // super.searchController,
    super.leadingWidget,
    super.trailingWidgetList,
    super.dividerColor,
    super.viewBackgroundColor,
    super.headerTextStyle,
    super.headerHintStyle,
    super.textInputType,
    super.viewOnSubmittedFunction,
    super.searchSuggesstionBuilder,
    super.resultFetchingFunction,
    super.resultsBuilder,
    super.viewBuilderFunction,
    super.isFullScreen = true,
    super.queryHintText = 'Search',
    super.textInputAction = TextInputAction.search,
    super.loadingBuilder,
    GestureTapCallback? onTap,
  }) : super(
          builder: (context, controller) {
            return IconButton(
              onPressed: () {
                controller.openView();
                onTap?.call();
              },
              icon: Icon(icon),
            );
          },
        );
}

class _CustomSearchAnchorWithBar<T> extends CustomSearchAnchor<T> {
  _CustomSearchAnchorWithBar()
      : super(
          isFullScreen: false,
          resultsBuilder: (T value) {
            return Text('asd');
          },
          builder: (context, controller) {
            return SearchBar(
              controller: controller,
              autoFocus: false,
              onTapOutside: (event) {},
              leading: Icon(Icons.search_outlined),
              // enabled: false,
              onChanged: (String value) {
                controller.openView();
              },
              onTap: () {
                controller.openView();
              },
            );
          },
        );
}

/// Seperates [buildSearchAnchor] method in order to seperate some logic
/// and increase readability of the code.
mixin _SearchAnchorBuilderMixin<T> on State<CustomSearchAnchor<T>> {
  /// `returns` [SearchAnchor] widget with some re-configured arguments
  Widget buildSearchAnchor(
    BuildContext context, {
    required SearchController searchController,
    bool isFullScreen = true,
    String? queryHintText,
    TextInputAction textInputAction = TextInputAction.search,
    Widget? leadingWidget,
    List<Widget>? trailingWidgetList,
    ValueChanged<String>? onQueryChanged,
    void Function(String query, SearchController controller)? viewOnSubmitted,
    Color? dividerColor,
    Color? viewBackgroundColor,
    TextStyle? headerHintStyle,
    TextStyle? headerTextStyle,
    TextInputType? keyboardType,
    required BuilderFunction builder,
    ViewBuilderFunction? viewBuilder,
    required SuggestionsBuilderFunction suggestionsBuilder,
  }) {
    return SearchAnchor(
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      dividerColor: dividerColor,
      headerHintStyle: headerHintStyle,
      headerTextStyle: headerTextStyle,
      viewBackgroundColor: viewBackgroundColor,
      searchController: searchController,
      viewOnChanged: onQueryChanged,
      viewOnSubmitted: (value) {
        viewOnSubmitted?.call(value, searchController);
      },
      isFullScreen: isFullScreen,
      viewHintText: queryHintText,
      viewLeading: leadingWidget,
      viewTrailing: trailingWidgetList,
      viewBuilder: viewBuilder,
      builder: builder,
      suggestionsBuilder: suggestionsBuilder,
    );
  }
}

// class _CustomSearchAnchorWithIcon extends CustomSearchAnchor {
//   _CustomSearchAnchorWithIcon() : super();
// }

typedef BuilderFunction = Widget Function(
    BuildContext context, SearchController controller);

/// Signature for a function that creates a [Widget] to build the suggestion list
/// based on the input in the search bar.
///
/// The `controller` callback provided to [SearchAnchor.suggestionsBuilder] can be used
/// to close the search view and control the editable field on the view.
typedef SuggestionsBuilderFunction = FutureOr<Iterable<Widget>> Function(
    BuildContext context, SearchController controller);

/// Signature for a function that creates a [Widget] to layout the suggestion list.
///
/// Parameter `suggestions` is the content list that this function wants to lay out.
typedef ViewBuilderFunction = Widget Function(Iterable<Widget> suggestions);

typedef ViewOnSubmittedFunction = void Function(SearchController controller);

typedef ResultFetchingFunction<T> = FutureOr<List<T>> Function(
    String searchText);

typedef WidgetBuilderFunction<T> = Widget Function(T value);
