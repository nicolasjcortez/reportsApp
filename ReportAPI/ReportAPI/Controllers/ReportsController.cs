using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ReportAPI.Model;

namespace ReportAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportsController : ControllerBase
    {
        private readonly ReportContext _context;

        public ReportsController(ReportContext context)
        {
            _context = context;
        }

        // GET: api/Reports
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Report>>> GetReport()
        {
            return await _context.Report.ToListAsync();
        }

        // GET: api/Reports/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Report>> GetReport(string id)
        {
            var report = await _context.Report.FindAsync(id);

            if (report == null)
            {
                return NotFound();
            }

            return report;
        }

        // PUT: api/Reports/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
       /* [HttpPut("{id}")]
        public async Task<IActionResult> PutReport(string id, Report report)
        {
            if (id != report.name)
            {
                return BadRequest();
            }

            _context.Entry(report).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ReportExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }*/

        // POST: api/Reports/NAME
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost("{id}")]
        public async Task<ActionResult<Report>> PostReport(string id)
        {

            Report report = await _context.Report.FindAsync(id);

            //create and add report if it doesnt exists
            if (report == null)
            {
                report = new Report();
                report.name = id;
                using (StreamReader reader = new StreamReader(Request.Body, Encoding.UTF8))
                {
                    report.reportJson = await reader.ReadToEndAsync();
                }
                _context.Report.Add(report);
            }
            // update if it exists
            else
            {
                using (StreamReader reader = new StreamReader(Request.Body, Encoding.UTF8))
                {
                    report.reportJson = await reader.ReadToEndAsync();
                }
                _context.Entry(report).State = EntityState.Modified;
            }
            
            
            await _context.SaveChangesAsync();
            

            return CreatedAtAction("GetReport", new { id = report.name }, report);
        }

        // DELETE: api/Reports/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Report>> DeleteReport(string id)
        {
            var report = await _context.Report.FindAsync(id);
            if (report == null)
            {
                return NotFound();
            }

            _context.Report.Remove(report);
            await _context.SaveChangesAsync();

            return report;
        }

        private bool ReportExists(string id)
        {
            return _context.Report.Any(e => e.name == id);
        }
    }
}
