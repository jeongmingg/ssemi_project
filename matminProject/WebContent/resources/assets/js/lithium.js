/*
 * Lithium Design System / v1.0.0
 * demonicdior@icloud.com
*/

// Import Plugins
// import plugin js file is not working IE
// import rangeSlider from './plugins/rangeslider.min'

// JQuery Check
if (typeof window.jQuery === 'undefined') {
  throw new Error('Lithium Design System requires JQuery');
}

// Set Lithium
$.Lithium = {};

/* --------------------
 * - Lithium Options -
 * --------------------
 * Set Default Lithium Options
 */
$.Lithium.options = {
  selectedTheme: 'theme-white',
  themes: [
    'theme-white',
    'theme-dark'
  ],
  layout: {
    sideFirst: true,
    fixed: true
  },
  layoutElements: {
    'header-banner': { isFullWidth: true, height: 0 },
    'header-bar': { isFullWidth: true, height: 0 },
    'contents-wrapper': { isFullWidth: false, height: 0 },
    'side-bar': { isFullWidth: false, height: 0 },
    'side-bar-menu': { isFullWidth: false, height: 0 },
    'footer-bar': { isFullWidth: true, height: 0 },
    'bottom-tabs-bar': { isFullWidth: true, height: 0 }
  },
  screenSizes: {
    xs: 360,
    sm: 600,
    md: 1280,
    lg: 1920
    // xl: over 1920
  }
}

/* ------------------
 * - Implementation -
 * ------------------
 * The next block of code implements Lithium's
 * functions and plugins as specified by the options above.
 */
$(function () {
  'use strict';

  // set up the object
  init();

  // Set screen size on body
  $.Lithium.detectScreenSize();

  // Set Theme on body
  $.Lithium.setTheme();
});
/* ---------------------------------
 * - Initialize the Lithium Object -
 * ---------------------------------
 * All Lithium functions are implemented below.
 */
function init () {
  'use strict';

  /**
   * Detect Screen Size
   * @returns void
   */
  $.Lithium.detectScreenSize = function () {
    var screenSizes = $.Lithium.options.screenSizes;
    var winWidth = function() {
      var w = 0;
      // IE
      if (typeof(window.innerWidth) != 'number') {
        if (!(document.documentElement.clientWidth === 0)) {
          // strict mode
          w = document.documentElement.clientWidth;
        } else {
          // quirks mode
          w = document.body.clientWidth;
        }
      } else {
        // w3c
        w = window.innerWidth;
      }
      return w;
    };
    var setScreenClass = function () {
      var w = winWidth();
      var body = $('body');
      var prefix = 'screen-';

      // init screen class on body
      body.removeClass([prefix + 'xs', prefix + 'sm', prefix + 'md', prefix + 'lg', prefix + 'xl']);

      // set screen class on body
      if (w < screenSizes.xs) {
        body.addClass(prefix + 'xs');
      } else if (w >= screenSizes.xs && w < screenSizes.sm) {
        body.addClass(prefix + 'sm');
      } else if (w >= screenSizes.sm && w < screenSizes.md) {
        body.addClass(prefix + 'md');
      } else if (w >= screenSizes.md && w < screenSizes.lg) {
        body.addClass(prefix + 'lg');
      } else {
        body.addClass(prefix + 'xl');
      }
    }

    // self call
    setScreenClass();

    // window resize call
    $(window).on('resize', function () {
      setScreenClass();
    });
  };

  /**
   * Set Theme
   * @param String cls the new skin class
   * @returns void
   */
  $.Lithium.setTheme = function (theme) {
    var themes = $.Lithium.options.themes

    // init theme class on body
    $.each(themes, function (i) {
      $('body').removeClass(themes[i])
    })

    // set theme class on body
    $('body').addClass(typeof theme === 'undefined' ? $.Lithium.options.selectedTheme : theme)
  };

  /**
   * Set Layout
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.setLayout = function () {
    var layout = $.Lithium.options.layout
    var layoutElement = $.Lithium.options.layoutElements

    // check dom element exist & set height
    var getLayoutStatus = function () {
      $.each(Object.keys(layoutElement), function(index, key) {
        layoutElement[key].height = $('#' + key).outerHeight() || 0;
      });

      return layoutElement
    };

    // contents-wrapper
    var setContentsWrapper = function () {
      var layoutStatus = getLayoutStatus();
      var paddingTop = layoutStatus['header-bar'].height + layoutStatus['header-banner'].height + 'px'
      var paddingBottom = layoutStatus['bottom-tabs-bar'].height + 'px'
      $('#contents-wrapper').css({ paddingTop: paddingTop });
      $('#contents-wrapper').css({ paddingBottom: paddingBottom });
    };

    getLayoutStatus();

    // side bar set position & height
    if (layoutElement['side-bar'].height > 0 && !layout.sideFirst) {
      var unIncludes = $.map(Object.keys(layoutElement), function(key, index) { return (layoutElement[key].isFullWidth && layoutElement[key].height > 0) ? layoutElement[key].height : 0 })
        .reduce(function(accumulator, currentValue) { return accumulator + currentValue });

      console.log(layoutElement['header-banner'].isFullWidth ? layoutElement['header-banner'].height : 0)
      console.log(layoutElement['header-bar'].isFullWidth ? layoutElement['header-bar'].height : 0)
      console.log(layoutElement['header-banner'].isFullWidth ? layoutElement['header-banner'].height : 0 + (layoutElement['header-bar'].isFullWidth ? layoutElement['header-bar'].height : 0))

      $('#side-bar').css({
        height: 'calc(100vh - ' + unIncludes + 'px)',
        top: (layoutElement['header-banner'].isFullWidth ? layoutElement['header-banner'].height : 0) + (layoutElement['header-bar'].isFullWidth ? layoutElement['header-bar'].height : 0)
      });
    } else if (layout.fixed) {
      $('#side-bar').css({
        zIndex: '110'
      })
      setContentsWrapper();
    }

    // add resize listener for contents-wrapper padding
    $(window).on('resize', function () {
      setContentsWrapper();
    })
  }

  /**
   * Side Menu
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.sideMenu = function () {
    var selector = {
      sideBar: '#side-bar',
      menuArea: '.menu-area',
      menuItem: '.menu-item'
    }
    var className = {
      on: 'on'
    }

    // $(document).on('click', selector.sideBar + ' ' + selector.menuArea + ' ' + selector.menuItem, function () {
    //   var menuItems = $(this).closest(selector.menuArea).find(selector.menuItem);
    //   $.each(menuItems, function (index, item) {
    //     $(item).removeClass(className.on)
    //   });
    //
    //   $(this).addClass(className.on)
    // });
  }

  /**
   * Toggle Side Sub Menu
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.sideSubMenuToggle = function () {
    var selector = {
      sideBar: '#side-bar',
      sideBarToggle: '.side-bar-toggle',
      menuArea: '.menu-area',
      menuItem: '.menu-item'
    }
    var className = {
      on: 'on',
      byMenu: 'by-menu',
      sideBarSubOpen: 'side-bar-sub-open'
    }
    var body = $('body')

    return {
      toggleSideBar: function (option) {
        if (typeof option === 'undefined' || !option.direct) {
          $(selector.sideBar + ' ' + selector.menuItem).removeClass('on');
        }
        $('body').removeClass(className.byMenu);
        $('body').toggleClass(className.sideBarSubOpen);
      },
      toggleMenu: function (self, option) {
        var isSideBarOpen = body.hasClass(className.sideBarSubOpen)
        var menuItems = self.closest(selector.menuArea).find(selector.menuItem);
        var initMenuItems = function () {
          $.each(menuItems, function (index, item) {
            $(item).removeClass(className.on)
          });
        }

        if (self.hasClass(className.on)) {
          if (typeof option === 'undefined' || !option.direct) {
            $('body').removeClass(className.sideBarSubOpen)
            $('body').removeClass(className.byMenu)
            initMenuItems();
          }
        } else {
          if (typeof option === 'undefined' || !option.direct) {
            $('body').addClass(className.sideBarSubOpen)
            $('body').addClass(className.byMenu)
          }
          initMenuItems()
          self.addClass(className.on)
        }
      }
    }
  }

  /**
   * Toggle Header dropdown menu
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.headerDropdownMenu = function () {
    var selector = {
      headerBarSub: '#header-bar-sub',
      dropdown: '.dropdown',
      dropdownToggle: '.dropdown-toggle',
      nav: '.nav'
    }
    var className = { on: 'on' }

    $(selector.headerBarSub + ' ' + selector.dropdownToggle).on('click', function () {

    });
    return {
      toggleDropdownMenu: function (self, option) {
        var dropdowns = self.closest(selector.nav).find(selector.dropdown);
        var initDropdowns = function () {
          $.each(dropdowns, function (index, item) {
            $(item).removeClass(className.on)
          });
        }

        if (!self.closest(selector.dropdown).hasClass(className.on)) {
          initDropdowns()
          self.closest(selector.dropdown).addClass('on')
        }
      }
    }
  };

  /**
   * Tree Menu
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.treeMenu = function () {
    var option = {
      animationSpeed: 500,
      accordion: true
    }

    var selector = {
      treeWrapper: '.menu-accordion-wrapper',
      tree: '.menu-accordion',
      treeView: '.tree-view',
      treeViewMenu: 'tree-view-menu',
      open: '.open, active',
      active: 'active',
      disabled: '.disabled'
    }

    var className = {
      open: 'open',
      tree: 'tree',
      side: 'side'
    }
    var init = function (option) {
      console.log(option)
      var initialize = function () {
        $.each($(selector.tree + '.side'), function (index, item) {
          var treeViewMenu = $(item).find('.' + selector.treeViewMenu)
          var treeOpenWidth = $(item).closest('.mega-menu').length > 0 ? 320 : 230
          var searchBar = $(item).closest('.menu-accordion-wrapper').prev('.search-bar-container')

          $.each(treeViewMenu, function (tvmIndex, tvmItem) {
            var sideStartPositionBounding = $(tvmItem).prev().get(0).getBoundingClientRect()
            var sideStartPosition = sideStartPositionBounding.width
            if (searchBar.length > 0) {
              var searchBarRect = searchBar.get(0).getBoundingClientRect()
              $(tvmItem).css({
                // top: searchBarRect.height + 'px',
                height: 'calc(100vh - ' + searchBarRect.height + 'px)',
                left: sideStartPosition + 'px'
              })
            } else {
              $(tvmItem).css({ left: sideStartPosition })
            }

            if ($(tvmItem).closest('li').hasClass(className.open)) {
              treeOpenWidth = treeOpenWidth + sideStartPositionBounding.width
            }
          })

          if ($(item).closest(selector.treeWrapper).length > 0) {
            $(item).closest(selector.treeWrapper).prev('.search-bar-container').css({ width: treeOpenWidth + 'px' })
            $(item).closest(selector.treeWrapper).css({ width: treeOpenWidth + 'px' })
          }
        })
      }

      if (typeof option !== 'undefined' && option.delay) {
        setTimeout(function () {
          initialize();
        }, option.delay)
      } else {
        initialize();
      }
    }
    init();

    // resize event
    var doIt;
    window.onresize = function() {
      clearTimeout(doIt);
      doIt = setTimeout(function() {
        init();
      }, 300);
    };

    return {
      initTreeClick: function () {
        $(document).on('click', selector.tree + ' a', function (event) {
          var tree = $(this).closest(selector.tree)
          var treeViewMenu = $(this).next(selector.treeViewMenu);
          var parentLi = $(this).parent();
          var isOpen = parentLi.hasClass(className.open);
          var isSide = tree.hasClass(className.side)
          var parentLiBounding = parentLi.get(0).getBoundingClientRect()
          var treeViewMenuSideStartPosition = parentLiBounding.x + parentLiBounding.width

          var expand = function (target, parent) {
            if (option.accordion) {
              var openMenuLi = parent.siblings(selector.open);
              var openTree = openMenuLi.children(selector.treeViewMenu);
              collapse(openTree, openMenuLi);
            }
            parent.addClass(className.open);
            target.css({ display: 'block' });

            // side panel open
            if (isSide) {
              var searchBar = parent.closest('.menu-accordion-wrapper').prev('.search-bar-container')
              parent.children('.tree-view-menu').css({ left: treeViewMenuSideStartPosition + 'px' })
              if (searchBar.length > 0) {
                var searchBarBounding = searchBar.get(0).getBoundingClientRect()

                parent.children('.tree-view-menu').css({
                  // top: searchBarBounding.height + 'px',
                  height: 'calc(100vh - ' + searchBarBounding.height + 'px)'
                })
              }
              init()
            }
          };
          var collapse = function (target, parent) {
            parent.removeClass(className.open);
            parent.find(selector.treeView).removeClass(className.open).find(selector.treeViewMenu).hide();
            init()
          };

          if (parentLi.is(selector.disabled)) {
            return;
          }

          if (!parentLi.is(selector.treeView)) {
            $.each(tree.find('li'), function (index, item) {
              $(item).removeClass(selector.active)
            });
            parentLi.toggleClass(selector.active)
            return;
          }

          if ($(this).attr('href') === '#') {
            event.preventDefault();
          }

          if (isOpen) {
            collapse(treeViewMenu, parentLi);
          } else {
            expand(treeViewMenu, parentLi);
          }
        })
      },
      init: function (option) {
        init(option)
      },
      toggleMegaMenu: function (option) {
        $('body').toggleClass('mega-menu-open');
        init(option);
      }
    }
  }

  /**
   * Toggle Header Bar Sub
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.headerBarSubToggle = function () {
    var selector = {
      headerBar: '#header-bar',
      menuToggle: '.menu-toggle',
      headerBarSub: '#header-bar-sub',
      close: '.close',
      dim: '.dim'
    }
    var className = { on: 'on' }

    // add open trigger
    $(document).on('click', selector.headerBar + ' ' + selector.menuToggle, function () {
      var headerBar = $(this).closest(selector.headerBar)
      var headerBarSub = headerBar.find(selector.headerBarSub)

      headerBarSub.toggleClass(className.on)
    })

    // add close trigger
    $(document).on('click', selector.headerBar + ' ' + selector.headerBarSub, function (e) {
      if ($(e.target).closest(selector.dim).length > 0 || $(e.target).closest(selector.close).length > 0) {
        $(this).closest(selector.headerBarSub).removeClass(className.on)
      }
    })
  };

  /**
   * Input
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.input = function () {
    var selector = {
      inputGroup: '.input-group',
      inputBox: '.input-box',
      inputGroupTools: '.input-group-tools',
      searchBar: '.search-bar',
      searchFilterWrapper: '.search-filter-wrapper',
      searchFilter: '.search-filter',
      searchHistoryPanel: '.search-history-panel'
    }
    var className = { on: 'on' }

    return {
      init: function () {
        // set input
        $.each($(selector.inputGroup), function (index, inputGroup) {
          var inputBox = $(inputGroup).find(selector.inputBox)
          var searchFilterWrapper = $(inputGroup).find(selector.searchFilterWrapper)
          var searchHistoryPanel = $(inputGroup).find(selector.searchHistoryPanel)
          var inputGroupTools = $(inputGroup).find(selector.inputGroupTools)
          var initSearchFilterWidth = 0

          // search filter
          if (searchFilterWrapper.length > 0) {
            var searchFilterWrapperWidth = searchFilterWrapper.get(0).getBoundingClientRect().width
            if (searchFilterWrapperWidth > 0) {
              initSearchFilterWidth = searchFilterWrapperWidth
              inputBox.css('padding-left', Math.ceil(searchFilterWrapperWidth) + 'px')
            }
          }

          // search history panel
          if (searchHistoryPanel.length > 0 && initSearchFilterWidth > 0) {
            searchHistoryPanel.css('padding-left', Math.ceil(initSearchFilterWidth) - 16 + 'px')
          }

          // input group tools
          if (inputGroupTools.get(0) && inputGroupTools.get(0).getBoundingClientRect().width > 0) {
            inputBox.css('padding-right', (Number(inputGroupTools.css('right').replace('px', '')) + inputGroupTools.get(0).getBoundingClientRect().width + 4) + 'px')
          }
        });
      },
      regListener: function () {
        // reg listener
        $(document).on('keyup', selector.inputBox, function () {
          var inputGroup = $(this).closest(selector.inputGroup)
          var inputGroupTools = inputGroup.find(selector.inputGroupTools)

          if (inputGroupTools.length > 0) {
            var inputGroupToolsWidth = Number(inputGroupTools.css('right').replace('px', '')) + inputGroupTools.get(0).getBoundingClientRect().width + 4

            if (typeof inputGroupTools.get(0).getBoundingClientRect() !== 'undefined' && inputGroupTools.get(0).getBoundingClientRect().width > 0) {
              $(this).css('padding-right', inputGroupToolsWidth + 'px')
            }
          }
        });
      }
    }
  };

  /**
   * Bottom Tabs ( Mobile Only)
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.bottomTabs = function () {
    var selector = {
      bottomTabsBar: '#bottom-tabs-bar',
      bottomTabs: '.bottom-tabs'
    }

    $(selector.bottomTabsBar + ' ' + selector.bottomTabs + ' ul > li').on('click', function () {
      $(this).closest('ul').find('li').removeClass('on')
      $(this).addClass('on')
    })
  }

  /**
   * View Password Toggle
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.viewPassword = function () {
    var selector = {
      inputGroup: '.input-group',
      target: '.view-password',
      input: '.input-box'
    }
    var className = {
      show: 'ico-show',
      hide: 'ico-hide'
    }
    var iconName = {
      show: 'visibility',
      hide: 'visibility_off'
    }

    return {
      init: function () {
        $(document).on('click', selector.target, function () {
          var parent = $(this).closest(selector.inputGroup)
          var input = parent.find(selector.input)
          if (!$(this).hasClass('on')) {
            $(this).addClass('on')

            // $(this).children().removeClass(className.hide)
            // $(this).children().addClass(className.show)
            $(this).children().text(iconName.show)
            input.attr('type', 'text')
          } else {
            $(this).removeClass('on')
            // $(this).children().removeClass(className.show)
            // $(this).children().addClass(className.hide)
            $(this).children().text(iconName.hide)
            input.attr('type', 'password')
          }
        });
      }
    }
  }
  /**
   * View Password Toggle
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.clearInput = function () {
    var selector = {
      clear: '.clear',
      input: '.input-box',
      inputBox: '.input-box',
      inputGroup: '.input-group',
      inputGroupTools: '.input-group-tools'
    };

    return {
      init: function () {
        // init
        $.each($(selector.input), function (index, item) {
          if ($(item).val().length > 0) {
            var clear = $(item).closest(selector.inputGroup).find(selector.inputGroupTools).find(selector.clear)
            clear.addClass('on');
          }
        })

        $(selector.input).on('propertychange change keyup paste input', function() {
          var tools = $(this).closest(selector.inputGroup).find(selector.inputGroupTools);
          var clear = tools.children(selector.clear)
          var val = $(this).val();

          if (val.length > 0) {
            clear.addClass('on');
          } else {
            clear.removeClass('on');
          }
        });


        $(selector.clear).on('click', function () {
          var inputGroup = $(this).closest(selector.inputGroup);
          var input = inputGroup.find(selector.inputBox);

          if (input.length > 0) {
            input.val('');
            $(this).removeClass('on');

            // call input init
            $.Lithium.input().init();
          }
        });
      }
    }
  };
  /**
   * View Password Toggle
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.inputContainer = function () {
    // var selector = {
    //   inputBox: '.input-box',
    //   inputGroup: '.input-group',
    //   inputGroupTools: '.input-group-tools'
    // }
    //
    // if ($(selector.inputBox).next().hasClass('input-group-tools')) {
    //   console.log($(selector.inputBox))
    //   console.log('has tools')
    // } else {
    //   console.log($(selector.inputBox))
    //   console.log('empty tools')
    // }
  };
  /**
   * Dropdown
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.dropdown = function () {
    var selector = {
      dropdown: '.dropdown',
      dropdownMenu: '.dropdown-menu',
      inputBox: '.input-box',
      dropdownMenuItem: '.dropdown-menu-item',
      dropdownMultiple: '.dropdown-multiple',
      dropdownMultipleClear: '.dropdown-multiple-clear',
      dropdownMultipleValue: '.dropdown-multiple-value',
      selected: '.selected',
      breadCrumb: '.breadcrumb',
      browserTab: '.browser-tab'
    };
    var className = {
      open: 'open',
      inputBox: 'input-box',
      top: 'dropdown-top',
      right: 'dropdown-right',
      bottom: 'dropdown-bottom',
      left: 'dropdown-left'
    };
    var multipleDropdownMenu = undefined;
    var multipleVal = [];
    var beforeCommitVal = [];

    // set multiple

    // open dropbox menu
    var openDropboxMenu = function (condition) {
      var dropdown = condition.element.parent();
      var dropdownMenu = condition.element.next(selector.dropdownMenu);

      dropdown.addClass(className.open);

      // dropdown multipleVal update
      if (condition.multiple) {
        var dropdownMenuItems = dropdownMenu.find(selector.dropdownMenuItem)
        var pushArr = []
        multipleDropdownMenu = dropdownMenu
        dropdownMenuItems.filter(selector.selected).each(function (index, item) {
          pushArr.push($(item).attr('data-value'))
        })
        // make clone
        multipleVal = pushArr.slice()
        beforeCommitVal = pushArr.slice()
      }

      // filter dropdown menu
      if (condition.element.is('input')) {
        filterDropdownMenuItem(condition.element);
      }

      // set position
      if (dropdown.hasClass(className.top)) {
        dropdownMenu.css({ transform: 'translate3d(0px, ' + (dropdownMenu.get(0).getBoundingClientRect().height * -1) + 'px' + ', 0px)' })
      } else if (dropdown.hasClass(className.right)) {
        dropdownMenu.css({ transform: 'translate3d(' + dropdown.get(0).getBoundingClientRect().width + 'px' + ', 0px, 0px)' })
      } else if (dropdown.hasClass(className.bottom)) {
        dropdownMenu.css({ transform: 'translate3d(0px, ' + (dropdown.get(0).getBoundingClientRect().height) + 'px' + ', 0px)' })
      } else if ((dropdown.hasClass(className.left))) {
        dropdownMenu.css({ transform: 'translate3d(' + (dropdown.get(0).getBoundingClientRect().width * -1) + 'px' + ', 0px, 0px)' })
      } else {
        dropdownMenu.css({ transform: 'translate3d(0px, ' + (dropdownMenu.get(0).getBoundingClientRect().height) + ', 0px);' })
      }
    };

    // filter dropdown menu item
    var filterDropdownMenuItem = function (element) {
      var thisVal = element.val()
      var dropdownMenuItems = element.closest(selector.dropdown).find(selector.dropdownMenuItem)
      dropdownMenuItems.each(function (index, item) {
        $(item).css({ display: $(item).attr('data-value').replace(' ', '').indexOf(thisVal.replace(' ', '')) > -1 ? 'block' : 'none' });
      });
    };

    var closeDropdownMenu = function () {
      // multiple dropdown history back
      if (typeof multipleDropdownMenu !== 'undefined') {
        // class change
        multipleDropdownMenu.find(selector.dropdownMenuItem).each(function (index, item) {
          if (multipleVal.indexOf($(item).attr('data-value')) === -1) {
            $(item).removeClass('selected');
          } else {
            $(item).addClass('selected');
          }
        });
      }

      // clear
      multipleDropdownMenu = undefined
      multipleVal = []
      beforeCommitVal = []

      // close dropdown menu
      $(selector.dropdown + '.open').removeClass(className.open);
    };

    // set history
    var controlMultipleItem = function (element) {
      var value = element.attr('data-value')

      element.toggleClass('selected')

      if ($(element).hasClass('selected')) {
        beforeCommitVal.push(value)
      } else {
        beforeCommitVal = jQuery.grep(beforeCommitVal, function(targetValue) {
          return targetValue !== value;
        });
      }
    }

    // commit dropdown multiple
    var commitDropdownMultiple = function (condition) {
      console.log(condition)
      var dropdown = condition.element.closest(selector.dropdown);
      var clearCount = dropdown.find(selector.dropdownMultipleClear);

      clearCount.text(beforeCommitVal.length)
      multipleVal = beforeCommitVal.slice();
      commitVal(condition);
    }

    var clearDropdownMultiple = function (condition) {
      // $.extend({}, object1, object2)
      var dropdown = condition.element.closest(selector.dropdown);
      var clearCount = dropdown.find(selector.dropdownMultipleClear);

      clearCount.text(0);
      multipleVal = []
      beforeCommitVal = []
      // selected class remove
      dropdown.find(selector.dropdownMenuItem).removeClass('selected')
      commitVal($.extend({}, condition, { doNotClose: true }))
    }

    var commitDropdownSingle = function (condition) {
      var dropdownMenu = condition.element.closest(selector.dropdownMenu);
      var dropdownMenuItems = dropdownMenu.find(selector.dropdownMenuItem);

      dropdownMenuItems.each(function (index, item) {
        if ($(item).attr('data-value') === condition.element.attr('data-value')) {
          $(item).addClass('selected');
        } else {
          $(item).removeClass('selected');
        }
      });

      commitVal(condition)
    }

    // commit value
    var commitVal = function (condition) {
      var value = condition.element.attr('data-value')
      var dropdown = condition.element.closest(selector.dropdown)
      var inputBox = dropdown.find(selector.inputBox)
      var dummyInputBox = dropdown.find('input.dummy')
      var dropdownMultipleValue = dropdown.find(selector.dropdownMultipleValue)

      console.log(condition)

      // 1. multiple 일때 multipleVal 값을 컴마로 변환하여 input 요소에 값 저장하고 button 요소에 값 변경
      if (condition.multiple) {
        var pushVal = function () {
          var returnVal = ''
          switch (multipleVal.length) {
            case 0:
              returnVal = ''
              break
            case 1:
              returnVal = multipleVal.join()
              break
            default:
              returnVal = multipleVal.join(', ')
              break
          }
          return returnVal
        }
        dropdownMultipleValue.text(pushVal())
        dummyInputBox.val(pushVal())
      } else {
        if (inputBox.is('input')) {
          inputBox.val(value);
        } else {
          dummyInputBox.val(value)
          inputBox.text(value);
        }
      }

      if (!condition.doNotClose) {
        dropdown.removeClass(className.open);
      }
    }

    // click event
    $(document).on('click', function (event) {
      var _this = $(event.target)
      var dropdown = _this.closest(selector.dropdown)

      if (dropdown.length === 0) {
        closeDropdownMenu();
      } else {
        var isMultiple = _this.closest(selector.dropdownMultiple).length > 0;

        // 1. breadcrumb {
        if (_this.closest(selector.breadCrumb).length > 0) {
          _this.closest(selector.dropdown).not('.disabled').toggleClass(className.open)
          return false;
        }

        // 2. browser tab
        if (_this.closest(selector.browserTab).length > 0) {
          _this.closest(selector.dropdown).not('.disabled').toggleClass(className.open)
          return false;
        }

        // 3. stand alone dropdown
        if (isMultiple) {
          // inputbox click
          if (_this.hasClass(className.inputBox)) {
            closeDropdownMenu();
            openDropboxMenu({ element: _this, multiple: isMultiple });
          } else if (_this.closest(selector.inputBox).length > 0) {

            // clear click
            if (_this.hasClass('dropdown-multiple-clear')) {
              clearDropdownMultiple({ element: _this, multiple: isMultiple });
            } else {
              closeDropdownMenu();
              openDropboxMenu({ element: _this.closest(selector.inputBox), multiple: isMultiple });
            }
          } else {
            // commit click
            if (_this.hasClass('dropdown-multiple-commit')) {
              commitDropdownMultiple({ element: _this, multiple: isMultiple });
            }
            // dropdown menu item click
            else {
              controlMultipleItem(_this);
            }
          }
          // dropdownmenu click
        } else {
          // input box click
          if (_this.hasClass(className.inputBox)) {
            closeDropdownMenu();
            openDropboxMenu({ element: _this, multiple: isMultiple });
          } else {
            // drop box menu click
            commitDropdownSingle({ element: _this, multiple: isMultiple });
          }
        }

        // if (_this.hasClass(className.inputBox)) {
        //   closeDropdownMenu();
        //   openDropboxMenu({ element: _this, multiple: isMultiple });
        // } else if (_this.closest(selector.inputBox).length > 0) {
        //   closeDropdownMenu();
        //   openDropboxMenu({ element: _this.closest(selector.inputBox), multiple: isMultiple });
        // } else if (_this.hasClass('dropdown-menu-item')) {
        //   if (isMultiple) {
        //     // commit click
        //     if (_this.hasClass('dropdown-multiple-commit')) {
        //       commitDropdownMultiple({ element: _this, multiple: isMultiple });
        //     }
        //     // clear click
        //     else if (_this.hasClass('dropdown-multiple-clear')) {
        //       clearDropdownMultiple({ element: _this, multiple: isMultiple });
        //     }
        //     // dropdown menu item click
        //     else {
        //       controlMultipleItem(_this);
        //     }
        //   }
        // }
      }
    });

    // change event
    $(selector.dropdown + '>' + 'input' + selector.inputBox).on('keyup', function () {
      filterDropdownMenuItem($(this));
    })

    // breadcrumb
    // $(selector.dropdown + '>' + 'a').on('click', function () {
    //   var breadCrumb = $(this).closest(selector.breadCrumb)
    //   var dropdown = $(breadCrumb).children(selector.dropdown)
    //   // var dropdownMenu =
    //   console.log('slslsls')
    //   dropdown.toggleClass(className.open)
    // })
  };
  /**
   * Accordion
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.accordion = function () {
    var selector = {
      accordion: '.accordion',
      accordionContents: '.accordion-contents',
      accordionList: '.accordion-list',
      btnAccordionToggle: '.btn-accordion-toggle'
    }
    var className = { on: 'on' }

    // accordion contents type
    $(selector.accordion + selector.accordionContents + ' ' + selector.btnAccordionToggle).on('click', function () {
      var accordion = $(this).closest(selector.accordion)
      accordion.toggleClass(className.on)
    })

    // accordion list type
    $(selector.accordion + selector.accordionList + ' ul' + ' li' + ' a').on('click', function () {
      var accordion = $(this).closest(selector.accordion)
      var li = $(this).closest('li')

      if (li.hasClass(className.on)) {
        accordion.find('li').removeClass(className.on)
      } else {
        accordion.find('li').removeClass(className.on)
        li.addClass(className.on)
      }
    });
  };
  /**
   * Content Switcher
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.contentSwitcher = function () {
    var selector = {
      contentSwitcher: '.content-switcher',
      switcher: '.switcher',
      contentSwitcherContent: '.content-switcher-content'
    }
    var className = {
      on: 'on'
    }
    var customAttr = {
      dataContentSwitcher: 'data-content-switcher'
    }

    $(selector.contentSwitcher + ' ' + selector.switcher).on('click', function () {
      var target = $(this).attr(customAttr.dataContentSwitcher)

      // switcher toggle
      $(this).closest(selector.contentSwitcher).find('ul').find('li').removeClass(className.on);
      $(this).closest('li').addClass(className.on)

      // content area toggle
      if ($(selector.contentSwitcherContent + '[' + customAttr.dataContentSwitcher + '=' + target + ']').length > 0) {
        $(selector.contentSwitcherContent).removeClass(className.on)
        $(selector.contentSwitcherContent + '[' + customAttr.dataContentSwitcher + '=' + target + ']').addClass(className.on)
      }
    });
  };

  /**
   * Table Select All
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.tableSelectAll = function () {
    var selector = {
      tableSelect: '.table-select',
      selectAll: '.select-all',
      selectAllItem: '.select-all-item',
      checkerItem: '.checker-item',
      dataTable: '.data-table'
    };
    var className = {
      on: 'on'
    };

    // select all
    $(selector.selectAll + '>' + 'input:checkbox').on('change', function () {
      var tableSelect = $(this).closest(selector.tableSelect);
      var value = $(this).is(':checked');
      var toggleTarget = tableSelect.find(selector.checkerItem + selector.selectAllItem).filter(function (i, item) {
        if ($(item).not(selector.selectAll).length > 0) { return item }
      });
      var selectAll = true

      $.each(toggleTarget, function (i, item) {
        var checkbox = $(item).find('input:checkbox')
        checkbox.not(':disabled').prop('checked', value);
        if (!checkbox.is(':checked')) {
          selectAll = false
        }
      });

      $(this).prop('checked', selectAll)
    });

    // low click tracker
    $(selector.tableSelect + '>' + 'tbody > tr').on('click', function (e) {
      var tableSelect = $(this).closest(selector.tableSelect)
      var rowSelect = $(this).find(selector.checkerItem + selector.selectAllItem).find('input:checkbox')
      var rowSelectChecked = rowSelect.is(':checked')
      var tableCheckToggle = function () {
        // row toggle checker
        rowSelect.prop('checked', !rowSelectChecked)

        var toggleTarget = tableSelect.find(selector.checkerItem + selector.selectAllItem).filter(function (i, item) {
          if ($(item).not(selector.selectAll).length > 0) { return item }
        });
        var selectAll = true
        $.each(toggleTarget, function (i, item) {
          if (!$(item).find('input:checkbox').is(':checked')) {
            selectAll = false
          }
        });
        tableSelect.find(selector.selectAll).find('input:checkbox').prop('checked', selectAll)
      }

      // data table
      if ($(this).closest(selector.dataTable).length > 0)  {
        if ($(e.target).closest(selector.checkerItem + selector.selectAllItem).length > 0) {
          tableCheckToggle();
        }
      }
      // list: table
      else {
        tableCheckToggle()
      }
    });
  };

  /**
   * Popup
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.popupHandler = {
    constants: {
      selector: {
        popupWrapper: '.popup-wrapper',
        popup: '.popup',
        searchDetail: '.search-detail',
        popupTitle: '.popup-title',
        popupContents: '.popup-contents',
        popupTools: '.popup-tools'
      },
      className: {
        on: 'on',
        popupFull: 'popup-full',
        popupWarning: 'popup-warning'
      }
    },
    open: function (condition) {
      // condition sample
      // var conditionSample = {
      //   full: true, // popup width full, auto
      //   warning: true, // popup warning type
      //   target: '#targetId', // popup target
      // }
      var constants = $.Lithium.popupHandler.constants
      var popupWrapper = condition.target ? $(condition.target) : $(constants.selector.popupWrapper)
      var popup = popupWrapper.find(constants.selector.popup)


      var setContentsMaxHeight = function () {
        var paddingTop = Number(popup.css('padding-top').replace('px', ''))
        var paddingBottom = Number(popup.css('padding-bottom').replace('px', ''))
        var paddingVertical = paddingTop + paddingBottom
        var popupContents = popup.find(constants.selector.popupContents)
        var titleH = popup.find(constants.selector.popupTitle).length > 0
          ? popup.find(constants.selector.popupTitle).get(0).getBoundingClientRect().height
          : 0
        var toolsH = popup.find(constants.selector.popupTools).length > 0
          ? popup.find(constants.selector.popupTools).get(0).getBoundingClientRect().height
          : 0

        popupContents.css('max-height', 'calc(100vh - ' + (paddingVertical + titleH + toolsH) + 'px)')
      }

      // init popup class
      popupWrapper.removeClass(constants.className.on)
      popup.removeClass([constants.className.popupFull, constants.className.popupWarning])

      // set popup option
      if (typeof condition !== 'undefined' && condition.full) {
        popup.addClass(constants.className.popupFull)
      }
      if (typeof condition !== 'undefined' && condition.warning) {
        popup.addClass(constants.className.popupWarning)
      }

      // on
      popupWrapper.addClass(constants.className.on)
      setContentsMaxHeight();

      // add listener
      $(window).resize(function () {
        setContentsMaxHeight()
      });
    },
    close: function () {
      var constants = $.Lithium.popupHandler.constants
      $(constants.selector.popupWrapper).removeClass(constants.className.on)
      $(constants.selector.searchDetail).removeClass(constants.className.on)
    }
  };

  /**
   * Popup
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.sheetHandler = {
    constants: {
      selector: {
        sheetWrapper: '.sheet-wrapper',
        sheetOnContents: '.sheet-on-contents',
        sheet: '.sheet',
        sheetTitle: '.sheet-title',
        sheetContents: '.sheet-contents'
      },
      className: {
        on: 'on',
        open: 'open',
        bottom: 'sheet-bottom',
        left: 'sheet-left',
        right: 'sheet-right',
        sheetOnContents: 'sheet-on-contents'
      }
    },
    open: function (condition) {
      var constants = $.Lithium.sheetHandler.constants
      var sheetWrapper = $(constants.selector.sheetWrapper).not(constants.selector.sheetOnContents)
      var sheetWrapperOnContents = $(constants.selector.sheetWrapper + constants.selector.sheetOnContents)


      if (typeof condition !== 'undefined' && condition.sheetOnContents) {
        // init sheet class
        sheetWrapperOnContents.removeClass(constants.className.open)

        // on sheet
        sheetWrapperOnContents.addClass(constants.className.open)
      } else if (typeof condition !== 'undefined' && !condition.sheetOnContents) {
        var setSheetContentsMaxHeight = function (isHalf) {
          var sheetTitleH = sheetWrapper.find(constants.selector.sheetTitle).outerHeight()
          var sheetContents = sheetWrapper.find(constants.selector.sheetContents)
          $(sheetContents).css({ height: isHalf ? 'calc(100vh / 2 - ' + sheetTitleH + 'px)' : 'calc(100vh - ' + sheetTitleH + 'px)' })
        }

        // init sheet class
        sheetWrapper.removeClass([constants.className.on, constants.className.left, constants.className.right, constants.className.bottom])

        // on sheet
        sheetWrapper.addClass(constants.className.on)

        // set sheet position
        if (typeof condition !== 'undefined' && !condition.sheetOnContents) {
          switch (condition.position) {
            case 'LEFT':
              sheetWrapper.addClass(constants.className.left)
              setSheetContentsMaxHeight(false)
              break
            case 'RIGHT':
              sheetWrapper.addClass(constants.className.right)
              setSheetContentsMaxHeight(false)
              break
            case 'BOTTOM':
              sheetWrapper.addClass(constants.className.bottom)
              setSheetContentsMaxHeight(true)
              break
            default:
              throw new Error('Sheet Position is not matching')
          }
        }

      }
    },
    close: function (condition) {
      var constants = $.Lithium.sheetHandler.constants
      var sheetWrapper = $(constants.selector.sheetWrapper).not(constants.selector.sheetOnContents)
      var sheetWrapperOnContents = $(constants.selector.sheetWrapper + constants.selector.sheetOnContents)

      if (typeof condition !== 'undefined' && condition.sheetOnContents) {
        sheetWrapperOnContents.removeClass(constants.className.open)
      } else if (typeof condition !== 'undefined' && !condition.sheetOnContents) {
        sheetWrapper.removeClass(constants.className.on)
      }
    },
    toggle: function () {
      var constants = $.Lithium.sheetHandler.constants
      var sheetWrapperOnContents = $(constants.selector.sheetWrapper + constants.selector.sheetOnContents)

      sheetWrapperOnContents.toggleClass(constants.className.open)
    }
  }

  /**
   * Tab
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.tab = function () {
    var selector = {
      tab: '.tab',
      tabItem: '.tab-item',
      tabContents: '.tab-contents',
      tabMenu: 'tab-menu',
      tabHorizon: '.tab-horizon',
      tabDropdown: '.tab-dropdown'
    }
    var className = {
      on: 'on',
      selected: 'selected'
    }
    var customAttr = {
      dataTabContents: 'data-tab-contents',
      dataValue: 'data-value',
      dataTabContentsGroup: 'data-tab-contents-group'
    }

    // tab-horizon click
    $(selector.tab + ' ' + selector.tabItem).on('click', function () {
      var target = $(this).attr(customAttr.dataTabContents)
      var targetGroup = $(this).attr(customAttr.dataTabContentsGroup)
      var tabItems = $(this).closest('ul').find('li')
      var tabContentsAll = $(selector.tabContents).filter(function (index, item) {
        if ($(item).attr(customAttr.dataTabContentsGroup) === targetGroup) { return item }
      });
      var tabDropdown = $(this).closest(selector.tab).find(selector.tabDropdown)

      // tab-item change
      $.each(tabItems, function (index, item) {
        if ($(item).find(selector.tabItem).attr(customAttr.dataTabContents) === target) {
          $(item).addClass(className.on)
        } else {
          $(item).removeClass(className.on)
        }
      })

      console.log(target)

      // tab-contents change
      $.each(tabContentsAll, function (index, item) {
        if ($(item).attr(customAttr.dataTabContents) === target) {
          $(item).addClass(className.on)
        } else {
          $(item).removeClass(className.on)
        }
      })

      // tab-dropdown change
      $(tabDropdown).find('input').val(target)
      $(tabDropdown).find('.input-box').text(target)
      $.each($(tabDropdown).find('.dropdown-menu-options').find('.dropdown-menu-item'), function (index, item) {
        if ($(item).attr(customAttr.dataValue) === target) {
          $(item).addClass(className.selected)
        } else {
          $(item).removeClass(className.selected)
        }
      })
    })

    // tab-dropdown change
    $(selector.tab + ' ' + selector.tabDropdown + ' ' + '.dropdown-menu-item').on('click', function () {
      var target = $(this).attr(customAttr.dataValue)
      var targetGroup = $(this).attr(customAttr.dataTabContentsGroup)
      var tabItem = $(this).closest(selector.tab).find(selector.tabItem)
      var tabContentsAll = $(selector.tabContents).filter(function (index, item) {
        if ($(item).attr(customAttr.dataTabContentsGroup) === targetGroup) { return item }
      });

      // tab-contents change
      $.each(tabContentsAll, function (index, item) {
        if ($(item).attr(customAttr.dataTabContents) === target) {
          $(item).addClass(className.on)
        } else {
          $(item).removeClass(className.on)
        }
      })

      // tab-horizon change
      $.each(tabItem, function (index, item) {
        if ($(item).attr(customAttr.dataTabContents) === target) {
          $(item).closest('li').addClass(className.on)
        } else {
          $(item).closest('li').removeClass(className.on)
        }
      })
    })
  };



  /**
   * Tag
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.tag = function () {
    var selector = {
      tag: '.tag',
      tagGroup: '.tag-group',
      remove: '.remove',
      disabled: '.disabled'
    }
    var className = {
      on: 'on'
    }

    $(document).on('click', selector.tag + ':not(' + selector.disabled + ')', function (event) {
      var _this = $(this)
      var tagGroup = _this.closest(selector.tagGroup)

      // remove click
      if ($(event.target).parent(selector.remove).length > 0) {
        if (tagGroup.length > 0) {
          _this.closest('li').remove();
        } else {
          _this.remove();
        }
        return false;
      }

      // toggle tag
      _this.toggleClass(className.on)
    })
  };

  /**
   * Overflow
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.overflow = function () {
    var selector = {
      overflow: '.overflow',
      overflowMenu: '.overflow-menu',
      disabled: '.disabled'
    }
    var className = {
      on: 'on'
    }

    $(selector.overflow).on('click', function (event) {

      // ignore dropdown menu item click
      if ($(event.target).not(selector.disabled).closest(selector.overflowMenu).length > 0) {
        $(this).removeClass(className.on)
        // return false;
      } else {
        $(this).toggleClass(className.on)
      }
    });

    $(document).on('click', function (event) {
      if ($(event.target).closest(selector.overflow).length === 0) {
        $(selector.overflow).removeClass(className.on)
      }
    });
  };

  /**
   * Loading
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.loading = {
    constants: {
      selector: {
        loading: '.loading',
        loadingFullScreen: '.loading-full-screen'
      },
      className: {
        on: 'on',
        fadeIn: 'fade-in',
        fadeOut: 'fade-out'
      }
    },
    call: function (params) {
      var constants = $.Lithium.loading.constants
      // $(constants.selector.loadingFullScreen).addClass(constants.className.on)
      $(constants.selector.loadingFullScreen).fadeIn( 400, 'swing' )

      if (typeof params !== 'undefined' && params.sampleTime > 0) {
        setTimeout(function () {
          $(constants.selector.loadingFullScreen).fadeOut( 400, 'swing' )
        }, params.sampleTime)
      }
    },
    done: function () {
      var constants = $.Lithium.loading.constants
      $(constants.selector.loadingFullScreen).fadeOut( 400, 'swing' )
    }
  };

  /**
   * Notification
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.notification = {
    constants: {
      selector: {
        noti: '.noti',
        notiGroupToast: '.noti-group-toast',
        notiGroupInline: '.noti-group-inline'
      },
      className: {
        notiInline: 'noti-inline',
        notiToast: 'noti-toast',
        error: 'error',
        warning: 'warning',
        success: 'success'
      }
    },
    call: function (params) {
      var constants = $.Lithium.notification.constants
      var timestamp = function (isTimestamp) {
        var today = new Date();
        var twoDigit = function (number) {
          return number > 9 ? number : '0' + number
        }
        var time = twoDigit(today.getHours()) + ':' + twoDigit(today.getMinutes()) + ':' + twoDigit(today.getSeconds());
        return isTimestamp ? today.getTime() : time
      }
      // var params = {
      //   type: 'toast', // inline, toast
      //   status: 'error', // error, warning, success, empty string
      //   description: {
      //     title: '정보 알림',
      //     main: '정보 알림 텍스트',
      //     sub: '는 이곳에 표시됩니다.'
      //   }
      // }
      var currentTimestamp = timestamp(true);

      var template = '<div class="noti noti-' + params.type + ' ' + params.status + '" data-ref="' + currentTimestamp + '">' +
        '       <span class="noti-icon"></span>\n' +
        '       <div class="noti-description">\n' +
        '         '+ (params.description.title ? '<p class="h8 title">'+ params.description.title +'</p>' : '') + '\n' +
        '         <p class="b3 description"><strong>' + params.description.main + '</strong>' + params.description.sub + '</p>\n' +
        '         '+ (params.type === 'toast' ? '<p class="b5 timestamp">Time Stamp [' + timestamp() + ']</p>' : '') + '\n' +
        '       </div>\n' +
        '       <button class="btn btn-icon close" onclick="$.Lithium.notification.remove(this)">\n' +
        '         <span class="icon"><i class="material-icons">close</i></span>\n' +
        '       </button>\n' +
        '     </div>'

      // push target
      if (params.type === 'inline') {
        $(constants.selector.notiGroupInline).html($.parseHTML(template))
      } else if (params.type === 'toast') {
        $(constants.selector.notiGroupToast).append($.parseHTML(template))
      }

      // 5seconds after remove
      setTimeout(function () {
        $(constants.selector.noti + '[data-ref="' + currentTimestamp + '"]').remove();
      }, 5000)
    },
    remove: function (self) {
      $(self).closest($.Lithium.notification.constants.selector.noti).remove();
    }
  };

  /**
   * Tooltip
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.tooltip = function () {
    $('.tooltip-click').on('click', function () {
      $(this).toggleClass('on')
    })

    $(document).on('click', function (event) {
      if ($(event.target).closest('.tooltip-click').length === 0) {
        $('.tooltip-click').removeClass('on')
      }
    });
  };

  /**
   * Stepper
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.stepper = function () {
    var selector = {
      stepperWrapper: '.stepper-wrapper',
      stepper: '.stepper',
      stepperItem: '.stepper-item', // value
      stepperInput: '.stepper-input',
      stepperCount: '.stepper-count',
      btnStep: '.btn-step',
      btnIncrease: '.btn-increase',
      btnDecrease: '.btn-decrease'
    }
    var className = {
      stepperTypeCenter: 'stepper-type-center',
      stepperTypeDefault: 'stepper-type-default',
      stepperTypeButton: 'stepper-type-button',
      disabled: 'disabled'
    }
    var methods = {
      calcOptions: function (stepperInput) {
        return {
          min: stepperInput.attr('min') ? Number(stepperInput.attr('min')) : undefined,
          max: stepperInput.attr('max') ? Number(stepperInput.attr('max')) : undefined,
          value: stepperInput.val() ? Number(stepperInput.val()) : 0,
          step: stepperInput.attr('step') ? Number(stepperInput.attr('step')) : 1,
          disabled: stepperInput.prop('disabled')
        }
      },
      calcMinMaxValue: function (value, min, max) {
        if (value <= min) {
          return min
        } else if (value >= max) {
          return max
        } else {
          return value
        }
      },
      updateBtnStepStatus: function (btnDecrease, btnIncrease, options) {
        // decrease
        if (options.value <= options.min) {
          btnDecrease.prop('disabled', true)
        } else {
          btnDecrease.prop('disabled', false)
        }

        // increase
        if (options.value >= options.max) {
          btnIncrease.prop('disabled', true)
        } else {
          btnIncrease.prop('disabled', false)
        }
      }
    }

    return {
      init: function () {
        $.each($(selector.stepper), function (index, stepper) {
          var stepperInput = $(stepper).find(selector.stepperInput)
          var btnDecrease = $(stepper).find(selector.btnDecrease)
          var btnIncrease = $(stepper).find(selector.btnIncrease)
          var options = methods.calcOptions(stepperInput)
          var isButtonType = $(stepper).closest(selector.stepperWrapper).hasClass(className.stepperTypeButton)

          if (isButtonType) { $(stepper).find(selector.stepperCount).text(options.value) }
          methods.updateBtnStepStatus(btnDecrease, btnIncrease, options)
        })

        // stepper input change
        $(document).on('change', selector.stepperInput, function () {
          var options = methods.calcOptions($(this))
          $(this).val(methods.calcMinMaxValue(options.value, options.min, options.max))
        })

        // stepper button click
        $(document).on('click', selector.btnStep, function () {
          var stepper = $(this).closest(selector.stepper)
          var stepperInput = stepper.find(selector.stepperInput)
          var btnDecrease = stepper.find(selector.btnDecrease)
          var btnIncrease = stepper.find(selector.btnIncrease)
          var stepperCount = stepper.find(selector.stepperCount)
          var options = methods.calcOptions(stepperInput)
          var updatedValue = options.value

          if ($(this).hasClass(selector.btnDecrease.replace('.', ''))) {
            if (typeof options.min !== 'undefined' && (options.min >= options.value)) {
              return false;
            } else {
              var newVal = methods.calcMinMaxValue((options.value - options.step), options.min, options.max)
              stepperInput.val(newVal)
              updatedValue = newVal
            }
          } else if ($(this).hasClass(selector.btnIncrease.replace('.', ''))) {
            if (typeof options.max !== 'undefined' && (options.max <= options.value)) {
              return false;
            } else {
              var newVal = methods.calcMinMaxValue((options.value + options.step), options.min, options.max)
              stepperInput.val(newVal)
              updatedValue = newVal
            }
          }
          options.value = updatedValue
          stepperCount.text(updatedValue)

          methods.updateBtnStepStatus(btnDecrease, btnIncrease, options)
        });

        // set before value
        // $(document).on('focusin', selector.stepperInput, function() {
        //   console.log('Saving value ' + $(this).val());
        //   $(this).data('val', $(this).val());
        // }).on('change', selector.stepperInput, function(){
        //   var prev = $(this).data('val');
        //   var current = $(this).val();
        //
        //   console.log("Prev value " + prev);
        //   console.log("New value " + current);
        // });
      }
    }
  }

  /**
   * Slider
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.slider = function () {
    $('input[type="range"]').rangeslider({
      // Feature detection the default is `true`.
      // Set this to `false` if you want to use
      // the polyfill also in Browsers which support
      // the native <input type="range"> element.
      polyfill: false,

      // Default CSS classes
      rangeClass: 'rangeslider',
      disabledClass: 'rangeslider--disabled',
      horizontalClass: 'rangeslider--horizontal',
      verticalClass: 'rangeslider--vertical',
      fillClass: 'rangeslider__fill',
      handleClass: 'rangeslider__handle',

      // Callback function
      onInit: function() {
        var inputSlider = $(this)[0].$element.closest('.input-slider');
        var minVal = $(this).attr('min');
        var maxVal = $(this).attr('max');
        inputSlider.find('.slider-min').text(minVal);
        inputSlider.find('.slider-max').text(maxVal);

      },

      // Callback function
      onSlide: function(position, value) {
        $(this)[0].$element.closest('.input-group.with-slider').find('.input-box').val( value );
      },

      // Callback function
      onSlideEnd: function(position, value) {
        console.log( value );
      }
    });

    $('input[type="range"]').rangeslider('update', true);

    $('.input-group.with-slider .input-box').on('change', function(){
      var value = $(this).val();
      $(this).closest('.input-group.with-slider').find('input[type="range"]').val( value ).change();
    });
  };

  /**
   * Slider
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.number = function () {
    var selector = {
      inputContainer: '.input-container',
      inputGroup: '.input-group',
      inputBox: '.input-box',
      numberSpinGroup: '.number-spin-group',
      btnDecrease: '.btn-decrease',
      btnIncrease: '.btn-increase'
    }
    var methods = {
      calcOptions: function (numberInput) {
        return {
          min: numberInput.attr('min') ? Number(numberInput.attr('min')) : undefined,
          max: numberInput.attr('max') ? Number(numberInput.attr('max')) : undefined,
          value: numberInput.val() ? Number(numberInput.val()) : 0,
          step: numberInput.attr('step') ? Number(numberInput.attr('step')) : 1,
          disabled: numberInput.prop('disabled')
        }
      },
      calcMinMaxValue: function (value, min, max) {
        if (value <= min) {
          return min
        } else if (value >= max) {
          return max
        } else {
          return value
        }
      },
      updateBtnStepStatus: function (btnDecrease, btnIncrease, options) {
        // decrease
        if (options.value <= options.min) {
          btnDecrease.prop('disabled', true)
        } else {
          btnDecrease.prop('disabled', false)
        }

        // increase
        if (options.value >= options.max) {
          btnIncrease.prop('disabled', true)
        } else {
          btnIncrease.prop('disabled', false)
        }
      }
    }

    return {
      init: function () {
        // stepper input change
        $(document).on('change', selector.inputBox + '[type="number"]', function () {
          var options = methods.calcOptions($(this))
          $(this).val(methods.calcMinMaxValue(options.value, options.min, options.max))
        })

        // stepper button click
        $(document).on('click', selector.inputGroup + ' ' + selector.numberSpinGroup + ' ' + 'button', function () {
          var inputGroup = $(this).closest(selector.inputGroup)
          var inputBox = inputGroup.find(selector.inputBox)
          var btnDecrease = inputGroup.find(selector.btnDecrease)
          var btnIncrease = inputGroup.find(selector.btnIncrease)
          var options = methods.calcOptions(inputBox)
          var updatedValue = options.value

          if ($(this).hasClass(selector.btnDecrease.replace('.', ''))) {
            if (typeof options.min !== 'undefined' && (options.min >= options.value)) {
              return false;
            } else {
              var newVal = methods.calcMinMaxValue((options.value - options.step), options.min, options.max)
              inputBox.val(newVal)
              updatedValue = newVal
            }
          } else if ($(this).hasClass(selector.btnIncrease.replace('.', ''))) {
            if (typeof options.max !== 'undefined' && (options.max <= options.value)) {
              return false;
            } else {
              var newVal = methods.calcMinMaxValue((options.value + options.step), options.min, options.max)
              inputBox.val(newVal)
              updatedValue = newVal
            }
          }
          options.value = updatedValue

          methods.updateBtnStepStatus(btnDecrease, btnIncrease, options)
        });

      }
    }
  };


  /**
   * Select
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.select = function () {
    var selector = {
      select: '.select',
      selectInput: '.select-input',
      selectText: '.select-text',
      selectMenu: '.select-menu',
      selectMenuItem: '.select-menu-item',
      selectOverlap: '.select-overlap',
      selectBottom: '.select-bottom',
      selectRight: '.select-right',
      searchFilterWrapper: '.search-filter-wrapper'
    }
    var className = {
      on: 'on',
      top: 'top',
      bottom: 'bottom'
    }

    return {
      init: function () {
        $(document).on('click', selector.select, function (e) {
          var selectMenu = $(this).find(selector.selectMenu)
          var eventTarget = $(e.target)

          if (eventTarget.closest(selector.selectMenu).length > 0) {
            var selectMenuItem = eventTarget.closest(selector.selectMenuItem)
            if (selectMenuItem.length > 0) {
              selectMenu.find('li').removeClass(className.on)
              selectMenuItem.closest('li').addClass(className.on)

              $(this).find(selector.selectInput).val(selectMenuItem.data('selectValue'))
              $(this).find(selector.selectText).text(selectMenuItem.data('selectValue'))
              $(this).removeClass(className.on)

              // search filter inner check
              if($(this).closest(selector.searchFilterWrapper).length > 0) {
                $.Lithium.input().init();
              }
            }
          } else {
            $(this).toggleClass(className.on)
          }
        })
      }
    }
  };


  /**
   * Search
   * @returns void
   */
  $.Lithium.search = function () {
    var selector = {
      searchBar: '.search-bar',
      searchDetail: '.search-detail',
      inputBox: '.input-box',
      inputGroup: '.input-group',
      searchHistoryPanel: '.search-history-panel',
      popup: '.popup'
    }
    var className = { on: 'on' }

    return {
      init: function () {
        $(document).on('click', selector.searchDetail, function (e) {
          var eventTarget = $(e.target)
          if (eventTarget.closest(selector.popup).length > 0) {

          } else {
            $(this).toggleClass(className.on)
          }
        })

        // focus in
        $(document).on('focusin', selector.searchBar + ' ' + selector.inputBox, function () {
          var inputGroup = $(this).closest(selector.inputGroup)
          var searchHistoryPanel = inputGroup.find(selector.searchHistoryPanel)

          if (searchHistoryPanel.length > 0) {
            searchHistoryPanel.addClass(className.on)
          }
        })
      },
      closeSearchHistoryPanel: function () {
        $(selector.searchHistoryPanel).removeClass(className.on)
      }
    }
  };


  /**
   * File uploader
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.fileUploader = function () {
    var selector = {
      fileUploader: '.file-uploader',
      fileUploaderArea: '.file-uploader-area',
      fileUploaderInput: '.file-uploader-input',
      btnUploader: '.btn-uploader'
    }

    return {
      init: function () {
        // 드래그 앤 드롭 파일 업로더 리스너 등록
        if ($(selector.fileUploaderArea).length > 0) {
          var droppedFiles = false
          var fileUploaderArea = $(selector.fileUploaderArea)
          $(document).on('drag dragstart dragend dragover dragenter dragleave drop', fileUploaderArea, function (e) {
            e.preventDefault()
            e.stopPropagation()
          })
          .on('dragover dragenter', function() {
            fileUploaderArea.addClass('is-dragover')
          })
          .on('dragleave dragend drop', function() {
            fileUploaderArea.removeClass('is-dragover')
          })
          .on('drop', function(e) {
            // 추후 async 방식의 파일을 전송 하는 로직 추가 하세요.
            droppedFiles = e.originalEvent.dataTransfer.files;
            console.log(droppedFiles)
          });
        };

        // 클릭 트리거
        if ($(selector.btnUploader).length > 0) {
          $(document).on('click', selector.btnUploader, function () {
            var fileUploader = $(this).closest(selector.fileUploader)
            var fileUploaderInput = fileUploader.find(selector.fileUploaderInput)

            fileUploaderInput.trigger('click')
          })
        }
      }
    };
  };


  /**
   * File uploader
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.dataTable = function () {
    var selector = {
      dataTable: '.data-table',
      btnSorterToggle: '.btn-sorter-toggle',
      directEdit: '.direct-edit',
      directEditTarget: '.direct-edit-target',
      inputContainer: '.input-container',
      inputBox: '.input-box',
      btnEdit: '.btn-edit',
      btnTool: '.btn-tool',
      withTools: '.with-tools',
      withInputBox: '.with-input-box',
      withCheck: '.with-check',
      disabled: '.disabled'
    }
    var className = { on: 'on' }

    $(document).on('click', function (e) {
      var _this = $(e.target)
      var dataTable = _this.closest(selector.dataTable)
      var isTarget = (
        _this.closest('td').length > 0
        && _this.closest('tbody').length > 0
        && dataTable.length > 0
        && !_this.closest('td').hasClass(selector.disabled.replace('.', ''))
        && !_this.closest('td').hasClass(selector.withCheck.replace('.', ''))
      )

      var clear = function () {
        $(selector.dataTable).find('tbody td.on').removeClass('on')
      }

      // 1. 데이터 테이블 내의 엑티브가 가능한 엘리먼트을 클릭
      if (isTarget) {
        clear();
        if (_this.closest(selector.directEdit).length > 0) {
          var directEdit = _this.closest(selector.directEdit);
          var value = $.trim(directEdit.find(selector.directEditTarget).get(0).childNodes[0].nodeValue);

          directEdit.addClass(className.on);
          $(directEdit).find(selector.inputBox).val(value).focus();
        } else {
          _this.closest('td').addClass(className.on);
        }
      }
      // 2. 데이터 테이블 내의 엑티브가 불가능한 엘리먼트를 클릭
      else {
        clear();
      }
    });

    // turn off edit mode
    $(document).on('focusout', selector.dataTable + ' ' + selector.directEdit + ' ' + selector.inputBox, function (e) {
      $(this).closest(selector.directEdit).removeClass(className.on)
    });

    // turn off edit mode by enter
    $(document).on('keyup', selector.dataTable + ' ' + selector.directEdit + ' ' + selector.inputBox, function (e) {
      if (e.key === 'Enter') { $(this).closest(selector.directEdit).removeClass(className.on) }
    });

    // update cell value
    $(document).on('change', selector.dataTable + ' ' + selector.directEdit + ' ' + selector.inputBox, function () {
      var target = $(this).closest(selector.directEdit).find(selector.directEditTarget).get(0);
      target.childNodes[0].nodeValue = $(this).val()
    });
  };



  /**
   * Textarea
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.textarea = function () {
    var selector = {
      textarea: '.textarea',
      count: '.count',
      clear: '.clear'
    }
    var countTextarea = function (el) {
      return el.val().length || 0
    }
    var dispatchCount = function (el) {
      var textarea = el.find('textarea')
      var maxlength = textarea.attr('maxlength')
      var count = el.find(selector.count)
      var template = countTextarea(textarea) + '/' + maxlength

      count.text(template)
    }

    // Init
    $.each($(selector.textarea), function (index, item) {
      dispatchCount($(item))
    })

    // Clear
    $(document).on('click', selector.textarea + ' ' + selector.clear, function (e) {
      var textarea = $(this).closest(selector.textarea).find('textarea')
      textarea.val('')
      dispatchCount($(this).closest(selector.textarea))
    });

    // Listener
    $(document).on('keyup', selector.textarea + ' ' + 'textarea', function (e) {
      var textarea = $(e.target).closest(selector.textarea)
      dispatchCount(textarea)
    })
  };

  /**
   * Pagination
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.pagination = function () {
    var selector = {
      pagination: '.pagination',
      paginationOption: '.pagination-option',
      paginationGroup: '.pagination-group',
      direction: '.direction',
      paginationItem: '.pagination-item',
      select: '.select'
    }
    var className = {
      on: 'on',
      prev: 'prev',
      left: 'left',
      right: 'right',
      next: 'next',
      disabled: 'disabled'
    }
    var offPagination = function (list) {
      $.each(list, function (index, item) {
        if ($(item).hasClass(className.on)) {
          $(item).removeClass(className.on)
          return false
        }
      })
    };
    var checker = function (el, isClass) {
      var list = [className.prev, className.left, className.right, className.next]
      if (isClass) {
        var liClass = ''
        list.some(function (item, index) {
          if (el.closest('.' + item).length > 0) liClass = item
        })
        return liClass
      } else {
        return list.some(function (item, index) {
          if (el.closest('.' + item).length > 0) return item
        })
      }
    }
    // 개발 없이 페이징 처리를 하기 위한 더미
    var dummy = {
      type1: {
        current: 1,
        total: 100,
        paginationCount: 10
      },
      type2: {
        current: 1,
        total: 50,
        paginationCount: 10
      }
    }
    var reCreate = function () {
      var pageJumper = '<li>\n' +
        '                      <div class="dp-inblock select">\n' +
        '                        <a href="#" class="pagination-item"><i class="Licon ico-elipsis"></i></a>\n' +
        '                        <div class="select-menu">\n' +
        '                          <ul>\n' +
        '                            <li class="on"><a href="#" class="select-menu-item" data-select-value="20"><p class="label">20</p></a></li>\n' +
        '                            <li><a href="#" class="select-menu-item" data-select-value="30"><p class="label">30</p></a></li>\n' +
        '                            <li><a href="#" class="select-menu-item" data-select-value="40"><p class="label">40</p></a></li>\n' +
        '                            <li><a href="#" class="select-menu-item" data-select-value="50"><p class="label">50</p></a></li>\n' +
        '                            <li><a href="#" class="select-menu-item" data-select-value="60"><p class="label">60</p></a></li>\n' +
        '                            <li><a href="#" class="select-menu-item" data-select-value="70"><p class="label">70</p></a></li>\n' +
        '                            <li><a href="#" class="select-menu-item" data-select-value="80"><p class="label">80</p></a></li>\n' +
        '                            <li><a href="#" class="select-menu-item" data-select-value="90"><p class="label">90</p></a></li>\n' +
        '                          </ul>\n' +
        '                        </div>\n' +
        '                        <div class="select-dim"></div>\n' +
        '                      </div>\n' +
        '                    </li>';
      var paginationList = '<li class=""><a href="#" class="pagination-item"><i>1</i></a></li>';
      var directionLeft = '<div class="pagination-group direction">\n' +
        '                  <ul>\n' +
        '                    <li class=""><a href="#" class="pagination-item prev"><i class="Licon ico-prev"></i></a></li>\n' +
        '                    <li class=""><a href="#" class="pagination-item left"><i class="Licon ico-left"></i></a></li>\n' +
        '                  </ul>\n' +
        '                </div>';
      var paginationGroup = '';
      var directionRight = '<div class="pagination-group direction">\n' +
        '                  <ul>\n' +
        '                    <li class=""><a href="#" class="pagination-item right"><i class="Licon ico-right"></i></a></li>\n' +
        '                    <li class=""><a href="#" class="pagination-item next"><i class="Licon ico-next"></i></a></li>\n' +
        '                  </ul>\n' +
        '                </div>';
    }

    $(document).on('click', selector.pagination + ' ' + selector.paginationGroup + ' ' + selector.paginationItem, function (e) {
      var _this = $(e.target)
      var prevLi = _this.closest(selector.pagination).find('.' + className.prev).closest('li')
      var leftLi = _this.closest(selector.pagination).find('.' + className.left).closest('li')
      var rightLi = _this.closest(selector.pagination).find('.' + className.right).closest('li')
      var nextLi = _this.closest(selector.pagination).find('.' + className.next).closest('li')
      var paginationList = $(_this).closest(selector.pagination).find(selector.paginationGroup + ':not(' + selector.direction + ') > ul > li')
      var hasSelect = paginationList.find(selector.select).length > 0
      var currentIdx = 0
      var hasSelectIdx = 0
      var getIdx = function () {
        $.each(paginationList, function (index, item) {
          if ($(item).hasClass(className.on)) {
            currentIdx = index
          } else if ($(item).find(selector.select).length > 0) {
            hasSelectIdx = index
          }
        })
      }
      var stepDisabled = function () {
        // check left right disabled
        getIdx();
        if ((currentIdx) === (hasSelect ? hasSelectIdx - 1 : paginationList.length - 1)) {
          rightLi.addClass(className.disabled)
          nextLi.addClass(className.disabled)
          prevLi.removeClass(className.disabled)
          leftLi.removeClass(className.disabled)
        } else if (currentIdx === 0) {
          rightLi.removeClass(className.disabled)
          nextLi.removeClass(className.disabled)
          prevLi.addClass(className.disabled)
          leftLi.addClass(className.disabled)
        } else {
          prevLi.removeClass(className.disabled)
          leftLi.removeClass(className.disabled)
          rightLi.removeClass(className.disabled)
          nextLi.removeClass(className.disabled)
        }
      }

      // 1. prev, left, right, next pagination-item click
      if (checker(_this)) {

        if (_this.closest('li').hasClass(className.disabled)) { return false }

        getIdx()
        offPagination(paginationList)

        switch (checker(_this, true)) {
          case className.prev:
            $(paginationList[0]).addClass(className.on)
            break
          case className.left:
            if ((currentIdx - 1) < 0) {
              // 페이지 리스트 갱신
            } else {
              $(paginationList[currentIdx - 1]).addClass(className.on)
            }
            break
          case className.right:
            if ((currentIdx + 1) >= (hasSelect ? hasSelectIdx : paginationList.length)) {
            } else {
              $(paginationList[currentIdx + 1]).addClass(className.on)
            }
            break
          case className.next:
            $(paginationList[paginationList.length - (hasSelect ? 2 : 1)]).addClass(className.on)
            break
          default:
            break
        }

        stepDisabled()
      }
      // 2. pagination-item click
      else {
        if (!(_this.closest(selector.select).length > 0)) {
          offPagination(_this.closest(selector.paginationGroup).find('> ul > li'))
          _this.closest('li').addClass(className.on)
          stepDisabled()
        }
      }
    });

  };


  /**
   * Browser Tab
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.browserTab = function () {
    var selector = {
      browserTab: '.browser-tab',
      tabs: '.tabs',
      tab: '.tab',
      tabLock: '.tab-lock',
      tabClose: '.tab-close',
      tools: '.tools',
      tabOnBefore: '.tab-on-before',
      tabOnAfter: '.tab-on-after',
      overflowMenu: '.overflow-menu'
    }
    var className = {
      on: 'on',
      lock: 'lock',
      disabled: 'disabled'
    }
    var data = []
    var push = function (index, item) {
      return {
        label: item.find(selector.tab + ' > span').text(),
        lock: item.hasClass(className.lock),
        on: item.hasClass(className.on),
        disabled: item.hasClass(className.disabled)
      }
    };
    var reCreateTabs = function (target) {
      var template = function (itemData) {
        return '<li class="' + (itemData.on ? className.on : '')  + ' ' + (itemData.lock ? className.lock : '') + (itemData.disabled ? className.disabled : '') +'">\n' +
          '                <div class="tab">\n' +
          '                  <span>' + itemData.label + '</span>\n' +
          '                  <div class="tools">\n' +
          '                    <button class="btn btn-icon tab-lock"><span class="icon"><i class="Licon ico-pin"></i></span></button>\n' +
          '                    <button class="btn btn-icon tab-close"><span class="icon"><i class="Licon ico-close"></i></span></button>\n' +
          '                  </div>\n' +
          '                </div>\n' +
          '              </li>'
      }
      var items = function () {
        var returnHtml = ''
        $.each(data, function (index, item) {
          returnHtml = returnHtml.concat('\n', template(item))
        })
        return returnHtml
      }
      var container = '<ul>' + items() + '</ul>'

      target.html(container)
    };
    var reCreateDropdown = function (target) {
      var template = function (itemData) {
        return '<li><a href="#" class="overflow-menu-item' + (itemData.disabled ? ' disabled' : '') + '">' + itemData.label + '</a></li>'
      }
      var items = function () {
        var returnHtml = ''
        $.each(data, function (index, item) {
          returnHtml = returnHtml.concat('\n', template(item))
        })
        return returnHtml
      }
      var container = '<ul>' + items() + '</ul>'

      target.html(container)
    }
    var navigatorUpdate = function () {
      var tabOnBefore = $(selector.browserTab + ' ' + selector.tools + ' ' + selector.tabOnBefore)
      var tabOnAfter = $(selector.browserTab + ' ' + selector.tools + ' ' + selector.tabOnAfter)


      if (data.length <= 1 || (data.length === 2 && data.some(function(item, index) { if (item.disabled) return item }))) {
        tabOnBefore.prop('disabled', true)
        tabOnAfter.prop('disabled', true)
        return false
      }

      if (data[0].on) {
        tabOnBefore.prop('disabled', true)
        tabOnAfter.prop('disabled', false)
      } else if (data[data.length - 1].on) {
        tabOnBefore.prop('disabled', false)
        tabOnAfter.prop('disabled', true)
      } else {
        tabOnBefore.prop('disabled', false)
        tabOnAfter.prop('disabled', false)
      }

    }
    var navigatorAction = function (direction) {

      var currentIdx
      $.each(data, function (index, item) {
        if (item.on) { currentIdx = index }
      })

      if (typeof currentIdx === 'undefined') { return false }

      if (direction === 'BEFORE') {
        if (typeof data[currentIdx - 1] === 'undefined' || data[currentIdx - 1].disabled) { return false }
        data[currentIdx].on = false
        data[currentIdx - 1].on = true
        scrollTo(currentIdx - 1)
      } else if (direction === 'AFTER') {
        if (typeof data[currentIdx + 1] === 'undefined' || data[currentIdx + 1].disabled) { return false }
        data[currentIdx].on = false
        data[currentIdx + 1].on = true
        scrollTo(currentIdx + 1)
      }
    }
    var scrollTo = function (idx) {
      var scroller = $(selector.browserTab + ' ' + selector.tabs)
      var targetTab = scroller.find('li')[idx]
      var scroll = $(targetTab).position().left;

      scroller.animate({'scrollLeft': scroll}, 300)
    }
    var init = function () {
      var override = []
      $.each($(selector.browserTab + ' ' + selector.tabs +  '> ul > li'), function (index, item) {
        override.push(push(index, $(item)))
      })
      data = override

      navigatorUpdate()
    };

    // Init
    init();

    $(document).on('click', selector.browserTab + ' ' + selector.tabs +  '> ul > li', function (e) {
      if ($(e.target).closest('li').hasClass(className.disabled)) {
        return false
      }

      var index = $(e.target).closest('li').index()
      var targetData = data[$(e.target).closest('li').index()]
      var dataUpdateByLock = function (toggle) {
        data.splice(index, 1)
        targetData.lock = toggle
        data.splice(lastLockIndex() + 1, 0, targetData)
      }

      if (index !== -1) {
        // Lock & Unlock
        if ($(e.target).closest(selector.tabLock).length > 0) {
          var lastLockIndex = function () {
            return data.filter(function (item, index) {
              if (item.lock === true) { return item }
            }).length - 1
          }

          // Toggle Lock
          if (targetData.lock) {
            dataUpdateByLock(false)
          } else {
            dataUpdateByLock(true)
          }
        }
        // Close
        else if ($(e.target).closest(selector.tabClose).length > 0) {
          if (data.length <= 1 || (data.length <= 2 && data.some(function(item, index) { if (item.disabled) { return item } }))) { return false }

          if (targetData.on) {
            data[(index === 0) ? 1 : index - 1].on = true
          }

          data.splice(index, 1)
        }
        // On & Off
        else {
          $.each(data, function (index, item) {
            item.on = false
          })
          targetData.on = true
        }

        reCreateTabs($(e.target).closest(selector.tabs))
        reCreateDropdown($(selector.browserTab + ' ' + selector.overflowMenu))
        navigatorUpdate()
      }
    })

    $(document).on('click', selector.browserTab + ' ' + selector.tools + ' ' + 'ul > li', function (e) {
      if ($(e.target).closest(selector.tabOnBefore).length > 0) {
        navigatorAction('BEFORE')
        reCreateTabs($(e.target).closest(selector.browserTab).find(selector.tabs))
        reCreateDropdown($(selector.browserTab + ' ' + selector.overflowMenu))
        navigatorUpdate()
      } else if ($(e.target).closest(selector.tabOnAfter).length > 0) {
        navigatorAction('AFTER')
        reCreateTabs($(e.target).closest(selector.browserTab).find(selector.tabs))
        reCreateDropdown($(selector.browserTab + ' ' + selector.overflowMenu))
        navigatorUpdate()
      }
    })

    $(document).on('click', selector.browserTab + ' ' + '.overflow-menu-item', function (e) {
      $.each(data, function (index, item) {
        item.on = false
      })
      data[$(e.target).closest('li').index()].on = true
      scrollTo($(e.target).closest('li').index())
      reCreateTabs($(e.target).closest(selector.browserTab).find(selector.tabs))
      reCreateDropdown($(selector.browserTab + ' ' + selector.overflowMenu))
      navigatorUpdate()
    })
  };



  /**
   * Toggle Nav Sub Panel Items
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.toggleNavSubPanelItems = function () {
    var selector = {
      navSubPanelWrapper: '.nav-sub-panel-wrapper',
      navSubPanel: '.nav-sub-panel',
      menuItem: '.menu-item'
    }

    $(selector.navSubPanel + ' ' + selector.menuItem).on('click', function () {
      var navSubPanelWrapper = $(this).closest(selector.navSubPanelWrapper)
      var initMenuItems = function () {
        $.each(navSubPanelWrapper.find(selector.menuItem), function (index, item) {
          $(item).removeClass('on')
        });
      };

      if (!$(this).hasClass('on')) {
        initMenuItems();
        $(this).addClass('on')
      }
    });
  }



  /**
   * Disabled Polyfill
   * required document elements on document ready
   * @returns void
   */
  $.Lithium.disabledPolyfill = function () {
    $(document).on('click', '.disabled', function (e) {
      e.preventDefault();
      return false
    })
  };
}


/* ----------------
 * - Load Lithium -
 * ----------------
 *
 */
// Ready - Before Mounted, Dom element is created
$(document).ready(function () {
  console.log('document ready done');
  $.Lithium.setLayout();
  $.Lithium.sideMenu();
  $.Lithium.headerDropdownMenu();
  $.Lithium.headerBarSubToggle();
  $.Lithium.contentSwitcher();
  $.Lithium.tableSelectAll();
  $.Lithium.tab();
  $.Lithium.tag();
  $.Lithium.overflow();
  $.Lithium.notification;
  $.Lithium.loading;
  $.Lithium.tooltip();
  $.Lithium.stepper().init();
  $.Lithium.slider();
  $.Lithium.input().init();
  $.Lithium.input().regListener();
  $.Lithium.number().init();
  $.Lithium.select().init();
  $.Lithium.search().init();
  $.Lithium.fileUploader().init();
  $.Lithium.clearInput().init();
  $.Lithium.viewPassword().init();
  $.Lithium.dataTable();
  $.Lithium.treeMenu();
  $.Lithium.treeMenu().initTreeClick();
  $.Lithium.sideSubMenuToggle();
  $.Lithium.dropdown();
  $.Lithium.accordion();
  $.Lithium.inputContainer();
  $.Lithium.textarea();
  $.Lithium.pagination();
  $.Lithium.browserTab();
  $.Lithium.bottomTabs();
  $.Lithium.toggleNavSubPanelItems();
  // $.Lithium.disabledPolyfill();
});


// Load - Mounted, Dom element is created & load resource is done
window.onload = function () {
  console.log('window on load done');
};
