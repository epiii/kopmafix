<?php

include("mpdf.php");

// define("_JPGRAPH_PATH", '../../jpgraph_5/src/'); // must define this before including mpdf.php file

define("_TTF_FONT_NORMAL", 'arial.ttf');
define("_TTF_FONT_BOLD", 'arialbd.ttf');

$mpdf=new mPDF();

$mpdf->useGraphs = true;

$html = '
<table id="tbl_1"><tbody>
<tr><td></td><td><b>Female</b></td><td><b>Male</b></td></tr>
<tr><td>35 - 44</td><td><b>4</b></td><td><b>2</b></td></tr>
<tr><td>45 - 54</td><td><b>5</b></td><td><b>7</b></td></tr>
<tr><td>55 - 64</td><td><b>21</b></td><td><b>18</b></td></tr>
<tr><td>65 - 74</td><td><b>11</b></td><td><b>14</b></td></tr>
<tr><td>75 - 84</td><td><b>10</b></td><td><b>10</b></td></tr>
<tr><td>85 - 94</td><td><b>2</b></td><td><b>1</b></td></tr>
<tr><td>95 - 104</td><td><b>1</b></td><td><b></b></td></tr>
<tr><td>TOTAL</td><td>54</td><td>52</td></tr>
</tbody></table>

<jpgraph table="tbl_1" type="bar" stacked="0" dpi="300" title="New subscriptions" splines="1" bandw="0" antialias="1" label-y="% patients" label-x="Age group" axis-x="text" axis-y="lin" percent="0"  series="cols" data-col-begin="2" data-row-begin="2" data-col-end="0" data-row-end="-1" show-values="1" width="600" legend-overlap="1" hide-grid="1" hide-y-axis="1" />
';

$mpdf->WriteHTML($html );
$mpdf->Output();
exit;
?>