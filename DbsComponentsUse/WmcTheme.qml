import QtQuick
import DbsComponents 1.0

DbsTheme {

    //Special
    property color editorCanvasBackground: "#FFFFFF"
    property color editorCanvasText: "#464648"

    //Dashboard
    property color dashboardTextColor: "#474749"
    property color dashboardDragColor: "darkgray"
    property color dashboardDragResize: "#005b96"
    property color dashboardDeleteColor: "#ff7b7b"
    property color dashboardCellColor: "gray"
    property color dashboardSelectColor: "#e1e1e1"
    property color dashboardColor: "#676467"
    property var dashboardTileGradientdColor: ["#ececec", "#efefef", "#e0e0e0"]
    property var dashboardTilePressedGradientColor: ["#f5b437", "#f4aa2f", "#f3a429"]
    property color dashboardCanInserTile: "#005b96"
    property color dashboardCanNotInsertTile: "#ff7b7b"

    //Nastbar
    property color nastBarRibbonEngineSwitchOnColor: "black" // added for fork of nastBarRibbonColor
    property color nastBarBackgroundColor: "black"
    property color nastBarRibbonColor: "#3c3c3c"
    property color nastBarRibbonColorBright: "#dadada"
    property color nastBarRibbonSpacerColor: "#bebebe"
    property color nastBarButtonColor: "#171919"
    property color nastBarScrollEnabled: "#474749"
    property color nastBarScrollDisabled: "lightgray"
    property var nastBarButtonSelected: ["#f7b638", "#f3a42b"]
    property var nastBarButtonToolChange: ["#ffeba7", "#e1d093"]
    property var nastBarButton: ["#fafafa", "#e1e1e1"]
    property var engineButton: ["#5A5A5A", "#3C3C3C"]
    property color nastBarAllEnginsAreRunningColor: "#73ba5c"

    //NastButton
    property color nastButtonSpindleRotationInidatorRunning: "#73ba5c"
    property color nastButtonSpindleRotationInidatorWaitingForStillstand: "#ffa500"

    //Tile / Item
    property color tileTextColor: "#474749"

    //WMC PrgressBar
    property color wmcProgressBarBackgroundColor: "#FFFFFF"
    property color wmcProgressBarColor: "#4296BB"
    property color wmcProgressBarIconDecorationColor: "#BEBEBE"

    //Task & ProductionStateUnitView
    property color taskBackgroundColor: "#F5F5F5"
    property color taskBorderColor: "#FFFFFF"

    //Distance Box
    property color distanceBoxBackgroundColor: "#F5F5F5"

    //Profil Editor
    property color axialPoint: "green"
    property color radialPoint: "red"
    property color maximumPoint: "orange"

    //Homescreen
    property var homescreenButtonGradientColor: ["#009539", "#1B4B23"]
    property color homescreenPageIndicatorColor: "#009835"

    //HSKDialog
    property color hskDialogPlaceholder: "#e7e6e6"
    property color hskDialogListBackgroundColor: "#ffffff"

    //SoftkeyPanel
    property color softkeyPanelBackgroundColor: "#333333"

    //TaskTile
    property color taskTileError:   "#B22930"
    property color taskTileFinish:  "#009835"
    property color taskTileElse:    "#4296BB"

    //ProductionView
    property color productionViewBackgroundColor: "#161718"

    //ProductionState
    property color productionStateBorderColor: "#FFFFFF"
    property color productionStateContentColor: "#F5F5F5"
    property color productionStateRectColor: "#4296BB"

    //FourSideProductionTile
    property color fourSideProductionTileTableColor: "#b8b9b9"

    //SetupMachineDetailsView
    property color setupMachineEditorBackgroundColor: "white"
    property color setupMachineBackgroundColor: "#cecfcf"

    //AggregatePage
    property color aggregatePageTextColor: "#707070"
    property color aggregatePageTextBackgroundColor: "#e2e2e2"
    property color aggregatePageBackgroundColor: "#cecfcf"

    //AggregateDetailView
    property color aggregateDetailViewToolAssignedColor: "#d14329"
    property color aggregateDetailViewToolNotAssignedColor: "#5c9c52"

    //UnitPositionEditArea
    property color unitPositionEditAreaBackgroundColor: "#707070"
    property color unitPositionEditAreaTextColor: "#F6F6F6"

    //PageIndicator
    property color pageIndicatorBorderColor: "white"
    property color pageIndicatorBackgroundColor: "#cccccc"
    property color pageIndicatorBackgroundColorSelected: "#4d4d4d"

    //IconButton
    property color iconButtonPressedColor: "#0d9a36"
    property color iconButtonColor: "#666666"
	
    //KeepPressedButton
    property color keepPressedButtonDisableColor: "#cbcbcb"
    property color keepPressedButtonEnableColor: "#666666"
    property color keepPressedButtonActiveColor: "#0d9a36"
    property color keepPressedButtonBorderColor: "#FFFFFF"
    property color keepPressedButtonInnerEnableColor: "#fafafa"
    property color keepPressedButtonInnerDisableColor: "#f5f5f5"
	
    //GaugeTile & Multitile & VibroTile
    property color gaugeBaseColor: "#cdcbcb"
    property color gaugeNormLimitColor: "#2c9d3f"
    property color gaugeWarnLimitColor: "#f7931e"
    property color gaugeElseLimitColor: "#bc3c3d"

    //WaxilitSpray
    property var waxilitSprayBackgroundColor: ["#fefefe", "#efefef", "#e0e0e0"]
	
    //AntiFrictionDialog
    property color antiFrictionDialogTableColor: "#8a8a8b"
    property color antiFrictionDialogScaleColor: "black"
    property color antiFrictionDialogLaneWidthTextColor: "white"

    //Switch
    property color switchDisabled:  "#cbcbcb"
    property color switchHandleDisabled: "#f5f5f5"
    property color switchHandle: "#fafafa"
    property color switchBackgroundActivated:  "#0d9a36"
    property color switchBackgroundDeactivated: "#666666"

    //State Switch
    property color stateSwitchDisabled:  "#cbcbcb"
    property color stateSwitchHandleDisabled: "#f5f5f5"
    property color stateSwitchHandle: "#fafafa"
    property color stateSwitchBackgroundActivated:  "#666666"
    property color stateSwitchBackgroundDeactivated: "#666666"

    //Base Aggregate Page
    property color baseAggregatePageActualValueLabel: "#e2e2e2"
    property color baseAggregatePageSpecialIndicator: "#707070"
    property color baseAggregatePageSpecialIndicatorRectangle: "#c6c6c6"
}
