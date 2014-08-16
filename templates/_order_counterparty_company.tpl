<div id="organisation" class="tab-pane active item">
  <input type="hidden" name="counterpartytype" value="company">
  <table class="table do_adminLinkedTable">
    <tbody>
        <tr>
            <td width="50%">{_ Please upload your company details or provide this information within Comments field _}</td>
            <td>
               <input id="companydetailsfile" type="file" name="companydetailsfile" size="18"></input>
            </td>
        </tr>
        <tr>
           <td colspan=2>
          <label class="control-label">{_ Comments _}</label>
          <div class="controls">
            <textarea rows="4" cols="10" id="comments" name="comments" ></textarea>
          </div>
           </td>
        </tr>
    </tbody>
  </table>
</div>

