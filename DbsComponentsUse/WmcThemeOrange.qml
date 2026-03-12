import QtQuick
import Com.Holzhor.DBSComponentPlugin 1.0

// import WeinigComponents 2.0

WeinigTheme {

   // tabViewTabBarColor: "green"
    tabViewTabColorSelected : tableViewBackgroundColor

    //Special
    property color editorCanvasBackground: "#FFFFFF" // no changes
    property color editorCanvasText: "#464648" // not used

    //Dashboard
    property color dashboardTextColor: "#474749" // no changes
    property color dashboardDragColor: "darkgray" // no changes
    property color dashboardDragResize: "#005b96" // no changes
    property color dashboardDeleteColor: "#ff7b7b" // no changes
    property color dashboardCellColor: "gray" // no changes
    property color dashboardSelectColor: "#e1e1e1" // no changes
    property color dashboardColor: "#676467" // no changes
    property var dashboardTileGradientdColor: ["#ececec", "#efefef", "#e0e0e0"] // no changes
    property var dashboardTilePressedGradientColor: ["#f5b437", "#f4aa2f", "#f3a429"] // no changes
    property color dashboardCanInserTile: "#005b96" // no changes
    property color dashboardCanNotInsertTile: "#ff7b7b" // no changes

    //Nastbar
    property color nastBarBackgroundColor: "black" // no changes
    property color nastBarRibbonColor: "#3c3c3c" // no changes but new color property nastBarRibbonEngineSwitchOnColor was needed
    property color nastBarRibbonEngineSwitchOnColor: "black" // added for fork of nastBarRibbonColor
    property color nastBarRibbonColorBright: "#dadada" // no changes
    property color nastBarRibbonSpacerColor: "#bebebe" // no changes
    property color nastBarButtonColor: "#171919" // no changes
    property color nastBarScrollEnabled: "#474749" // no changes
    property color nastBarScrollDisabled: "lightgray" // no changes
    property var nastBarButtonSelected: ["#f7b638", "#f3a42b"] // no changes
    property var nastBarButtonToolChange: ["#ffeba7", "#e1d093"] // no changes
    property var nastBarButton: ["#fafafa", "#e1e1e1"] // no changes
    property var engineButton: ["#5A5A5A", "#3C3C3C"] // no changes
    property color nastBarAllEnginsAreRunningColor: "#73ba5c" // no changes

    //NastButton
    property color nastButtonSpindleRotationInidatorRunning: "#73ba5c" // no changes
    property color nastButtonSpindleRotationInidatorWaitingForStillstand: "#ffa500" // no changes

    //Tile / Item
    property color tileTextColor: "#474749" // no changes

    //WMC PrgressBar
    property color wmcProgressBarBackgroundColor: "#FFFFFF" // no changes
    property color wmcProgressBarColor: "#4296BB" // no changes
    property color wmcProgressBarIconDecorationColor: "#BEBEBE" // no changes

    //Task & ProductionStateUnitView
    property color taskBackgroundColor: "#F5F5F5" // no changes
    property color taskBorderColor: "#FFFFFF" // no changes

    //Distance Box
    property color distanceBoxBackgroundColor: "#F5F5F5" // no changes

    //Profil Editor
    property color axialPoint: "green" // no changes
    property color radialPoint: "red" // no changes
    property color maximumPoint: "orange" // no changes

    //Homescreen
    property var homescreenButtonGradientColor: ["#ff6600", "#B53008"] // original:["#009539", "#1B4B23"]
    property color homescreenPageIndicatorColor: "#ff6600" // original:"#009835"

    //HSKDialog
    property color hskDialogPlaceholder: "#e7e6e6" // no changes
    property color hskDialogListBackgroundColor: "#ffffff" // no changes

    //SoftkeyPanel
    property color softkeyPanelBackgroundColor: "#333333" // no changes

    //TaskTile
    property color taskTileError:   "#B22930" // no changes
    property color taskTileFinish:  "#009835" // no changes
    property color taskTileElse:    "#4296BB" // no changes

    //ProductionView
    property color productionViewBackgroundColor: "#161718" // no changes

    //ProductionState
    property color productionStateBorderColor: "#FFFFFF" // no changes
    property color productionStateContentColor: "#F5F5F5" // no changes
    property color productionStateRectColor: "#4296BB" // no changes

    //FourSideProductionTile
    property color fourSideProductionTileTableColor: "#b8b9b9" // no changes

    //SetupMachineDetailsView
    property color setupMachineEditorBackgroundColor: "white" // no changes
    property color setupMachineBackgroundColor: "#cecfcf" // no changes

    //AggregatePage
    property color aggregatePageTextColor: "#707070" // no changes
    property color aggregatePageTextBackgroundColor: "#e2e2e2" // not used
    property color aggregatePageBackgroundColor: "#cecfcf" // not used

    //AggregateDetailView
    property color aggregateDetailViewToolAssignedColor: "#d14329" // no changes
    property color aggregateDetailViewToolNotAssignedColor: "#5c9c52" // no changes

    //UnitPositionEditArea
    property color unitPositionEditAreaBackgroundColor: "#707070" // no changes
    property color unitPositionEditAreaTextColor: "#F6F6F6" // no changes

    //PageIndicator
    property color pageIndicatorBorderColor: "white" // no changes
    property color pageIndicatorBackgroundColor: "#cccccc" // no changes
    property color pageIndicatorBackgroundColorSelected: "#4d4d4d" // no changes

    //IconButton
    property color iconButtonPressedColor: "#0d9a36" // no changes
    property color iconButtonColor: "#666666" // no changes
	
    //KeepPressedButton
    property color keepPressedButtonDisableColor: "#cbcbcb" // no changes
    property color keepPressedButtonEnableColor: "#666666" // no changes
    property color keepPressedButtonActiveColor: "#0d9a36" // no changes
    property color keepPressedButtonBorderColor: "#FFFFFF" // no changes
    property color keepPressedButtonInnerEnableColor: "#fafafa" // no changes
    property color keepPressedButtonInnerDisableColor: "#f5f5f5" // no changes
	
    //GaugeTile & Multitile & VibroTile
    property color gaugeBaseColor: "#cdcbcb" // no changes
    property color gaugeNormLimitColor: "#2c9d3f" // no changes
    property color gaugeWarnLimitColor: "#f7931e" // no changes
    property color gaugeElseLimitColor: "#bc3c3d" // no changes

    //WaxilitSpray
    property var waxilitSprayBackgroundColor: ["#fefefe", "#efefef", "#e0e0e0"] // no changes
	
    //AntiFrictionDialog
    property color antiFrictionDialogTableColor: "#8a8a8b" // no changes
    property color antiFrictionDialogScaleColor: "black" // no changes
    property color antiFrictionDialogLaneWidthTextColor: "white" // no changes

    //Switch
    property color switchDisabled:  "#cbcbcb" // no changes
    property color switchHandleDisabled: "#f5f5f5" // no changes
    property color switchHandle: "#fafafa" // no changes
    property color switchBackgroundActivated:  "#0d9a36" // no changes
    property color switchBackgroundDeactivated: "#666666" // no changes

    //State Switch
    property color stateSwitchDisabled:  "#cbcbcb" // no changes
    property color stateSwitchHandleDisabled: "#f5f5f5" // no changes
    property color stateSwitchHandle: "#fafafa" // no changes
    property color stateSwitchBackgroundActivated:  "#666666" // no changes
    property color stateSwitchBackgroundDeactivated: "#666666" // no changes

    //Base Aggregate Page
    property color baseAggregatePageActualValueLabel: "#e2e2e2" // no changes
    property color baseAggregatePageSpecialIndicator: "#707070" // no changes
    property color baseAggregatePageSpecialIndicatorRectangle: "#c6c6c6" // no changes

    //HOLZHER COLORS:
    property color statusIdle: "grey"
    property color statusDone: "#009539" //weinig green
    property color statusRunning: "#ff6600" //holzher WmcThemeOrange
    property color statusError: "#b0021f" //test red

    //Table view
    property var tableViewCellSelectedGradient: ["#f7b638", "#f3a42b"]
    property color tableViewCell: "#e6e6e6"
    property color tableViewBorder: "#bebebe"
    property color tableViewTextColor: "#464648"
    property color tableViewHeaderColor: "#dbdbdb"

    property color tableViewHeaderFixedColor: "#4d402d"
    property color tableViewCellFixed: "#fcdd9a"
    property int buttonMarginLeftRight: 23

    //Key
    property var keyGradient: ["#5a5a5a", "#3c3c3c"]
    property color keyBorder: "#808080"
    property color keyPadBackground: "#4d4d4d"
    property color keyPadGlow: "#000000"

    //Cockpit
    property color cockpitItem: "#3a3a3a"
    property color cockpitBeam: "#ffffff"
    property color cockpitBeamMarker: "#000000"
    property color cockpitBoundaryMarker: "#ffffff"
    property color cockpitValueColorNormal: "#ffffff"
    property color cockpitValueColorDanger: "#bb3a3b"
    property color cockpitUnitColor: "#ffffff"
    property color cockpitNormal: "#0d9a36"
    property color cockpitCritical: "#e0bd2b"
    property color cockpitDanger: "#bb3a3b"

    //CommonColors
    property color selection: "#f3a52b"



}
