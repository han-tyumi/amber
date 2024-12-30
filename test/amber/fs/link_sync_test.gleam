import amber/deno
import amber/deno/error
import amber/web/text_encoder
import gleeunit/should

pub fn link_sync_success_test() {
  let test_dir = deno.make_temp_dir_sync([])
  let old_data = "hardlink"
  let old_name = test_dir <> "/oldname"
  let new_name = test_dir <> "/newname"

  deno.write_file_sync(old_name, text_encoder.encode(old_data), [])

  // Create the hard link.
  let _ = deno.link_sync(old_name, new_name)

  // We should expect reading the same content.
  let new_data = deno.read_text_file_sync(new_name)
  should.equal(old_data, new_data)

  // Writing to newname also affects oldname.
  let new_data2 = "modified"
  deno.write_file_sync(new_name, text_encoder.encode(new_data2), [])
  should.equal(new_data2, deno.read_text_file_sync(old_name))

  // Writing to oldname also affects newname.
  let new_data3 = "modified_again"
  deno.write_file_sync(old_name, text_encoder.encode(new_data3), [])
  should.equal(new_data3, deno.read_text_file_sync(new_name))

  // Remove oldname. File still accessible through newname.
  deno.remove_sync(old_name, [])
  let new_name_stat = deno.stat_sync(new_name)
  should.be_true(new_name_stat.is_file)
  should.be_true(!new_name_stat.is_symlink)

  // Not a symlink.
  should.equal(new_data3, deno.read_text_file_sync(new_name))
}

pub fn link_sync_exists_test() {
  let test_dir = deno.make_temp_dir_sync([])
  let old_name = test_dir <> "/oldname"
  let new_name = test_dir <> "/newname"

  deno.write_file_sync(old_name, text_encoder.encode("old_name"), [])

  // newname is already created.
  deno.write_file_sync(new_name, text_encoder.encode("new_name"), [])

  deno.link_sync(old_name, new_name)
  |> should.equal(Error(error.AlreadyExists))
}

pub fn link_sync_not_found_test() {
  let test_dir = deno.make_temp_dir_sync([])
  let old_name = test_dir <> "/oldname"
  let new_name = test_dir <> "/newname"

  deno.link_sync(old_name, new_name)
  |> should.equal(Error(error.NotFound))
}
// TODO(@han-tyumi): Investigate incorporating perm tests.
// pub fn link_sync_read_perm_test() {
//   deno.link_sync("oldbaddir", "newbaddir")
//   |> should.equal(Error(error.NotCapable))
// }
// pub fn link_sync_write_perm_test() {
//   deno.link_sync("oldbaddir", "newbaddir")
//   |> should.equal(Error(error.NotCapable))
// }
